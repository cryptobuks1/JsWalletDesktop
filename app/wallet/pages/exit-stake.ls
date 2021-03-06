require! {
    \react
    \react-dom
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../icons.ls
    \../math.ls : { div, times, plus, minus }
    \../staking/can-make-staking.ls
    \../components/amount-field.ls
    \../components/button.ls
}
# .steps47089543
#     @media(max-width:800px)
#         text-align: center
#     .step
#         display: inline-block
#         vertical-align: text-top
#         text-align: center
#         padding: 0 20px 0 0
#         margin-right: 20px
#         margin-bottom: 20px
#         width: 140px
#         opacity: .6
#         position: relative
#         cursor: pointer
#         transition: all .5s
#         @media(max-width:800px)
#             padding: 0 10px
#             width: auto
#             margin: 0 auto 30px
#             display: block
#         &:last-child
#             &:after
#                 content: none !important
#         &:after    
#             display: block
#             left: 150px
#             top: 18px
#             position: absolute
#             border-top: 2px solid grey
#             width: 20%
#             content: ""
#             @media(max-width:800px)
#                 content: none
#         .step-content
#             font-size: 13px
#         button
#             width: auto
#             display: block
#             margin: 15px auto 0
#         .step-count
#             display: inline-block
#             background: grey
#             padding: 10px 15px
#             border-radius: 50px
#             margin-bottom: 20px
#         &.active
#             opacity: 1
#             .step-count
#                 background: #39dcb4
#                 animation: pulse_step 1s linear
#                 transform-origin: 50% 50%
#             &:after    
#                 display: block
#                 left: 150px
#                 top: 18px
#                 position: absolute
#                 border-top: 2px solid #3cd5af
#                 width: 20%
#                 content: ""
#                 @media(max-width:800px)
#                     content: none
#     @keyframes pulse_step
#         0%
#             transform: scale(0.8)
#         25%
#             transform: scale(0.9)
#         50%
#             transform: scale(1.1)
#         100%
#             transform: scale(1)
cb = console~log
order-withdraw-process = (store, web3t)->
    lang = get-lang store
    activate = (step)-> ->
        store.staking.exit-tab = step 
    activate-first = activate \exit_order
    activate-second = activate \exit_wait
    activate-third = activate \exit_ordered
    active-class = (step)->
        if store.staking.exit-tab is step then \active else ''
    active-first = active-class \exit_order
    active-second = active-class \exit_wait
    active-third = active-class \exit_ordered
    order = ->
        err, data <- web3t.velas.Staking.areStakeAndWithdrawAllowed!
        return cb err if err?
        return alert store, "Stake and Withdraw is not allowed right now", cb if data isnt yes
        staking-address = store.staking.keystore.staking.address
        pool-address = store.staking.chosen-pool.address
        err, max <- web3t.velas.Staking.maxWithdrawOrderAllowed(pool-address, staking-address)
        amount = store.staking.maxWithdrawOrderAllowed `times` (10^18)
        return alert store, "max is #{max.to-fixed!}" if +amount > +max.to-fixed!
        return alert store, "Max Withdraw Orer Allowed is 0 now", cb if +amount is 0
        data = web3t.velas.Staking.order-withdraw.get-data(pool-address, amount)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }        
    exit = ->
        return alert store, "No Ordered Amount", cb if +store.staking.orderedWithdrawAmount is 0
        pool-address = store.staking.chosen-pool.address
        data = web3t.velas.Staking.claimOrderedWithdraw.get-data(pool-address)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }
    change-max = (it)->
        store.staking.withdrawAmount = it.target.value
    react.create-element 'div', { className: 'section' }, children = 
        react.create-element 'div', { className: 'title' }, children = 
            react.create-element 'h3', {}, ' Exit'
        react.create-element 'div', { className: 'description' }, children = 
            react.create-element 'div', { className: 'left' }, children = 
                react.create-element 'div', { className: 'steps steps47089543' }, children = 
                    react.create-element 'div', { on-click: activate-first, className: "#{active-first} step" }, children = 
                        react.create-element 'div', { className: 'step-count' }, ' 1'
                        react.create-element 'div', { className: 'step-content' }, children = 
                            react.create-element 'div', {}, ' Please click the "Request exit" button'
                            if active-first is \active
                                react.create-element 'div', {}, children = 
                                    react.create-element 'div', {}, children = 
                                        amount-field { store, value: store.staking.withdrawAmount, on-change: change-max }
                                    button { store, text: "Request exit", icon: 'exit', on-click: order, type: "secondary" }
                    react.create-element 'div', { on-click: activate-second, className: "#{active-second} step" }, children = 
                        react.create-element 'div', { className: 'step-count' }, ' 2'
                        react.create-element 'div', { className: 'step-content' }, ' Come back in later for a your staking amount'
                    react.create-element 'div', { on-click: activate-third, className: "#{active-third} step" }, children = 
                        react.create-element 'div', { className: 'step-count' }, ' 3'
                        react.create-element 'div', { className: 'step-content' }, children = 
                            react.create-element 'div', {}, ' Withdraw the staking amount'
                            if active-third is \active
                                button { store, text: "Withdraw", icon: 'exit', on-click: exit, type: "secondary" }
fast-withdraw-process = (store, web3t)->
    lang = get-lang store
    exit = ->
        err <- can-make-staking store, web3t
        return alert store, err, cb if err?
        staking-address = store.staking.keystore.staking.address
        pool-address = store.staking.chosen-pool.address
        err, max <- web3t.velas.Staking.maxWithdrawAllowed(pool-address, staking-address)
        amount = store.staking.withdrawAmount `times` (10^18)
        return alert store, "max is #{max.to-fixed!}" if +amount > +max.to-fixed!
        return alert store, "Max Withdraw Allowed is 0", cb if +amount is 0
        data = web3t.velas.Staking.withdraw.get-data(pool-address, amount)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 } 
    change-max = (it)->
        store.staking.withdrawAmount = it.target.value
    react.create-element 'div', { className: 'section' }, children = 
        react.create-element 'div', { className: 'title' }, children = 
            react.create-element 'h3', {}, ' Exit'
        react.create-element 'div', { className: 'description' }, children = 
            react.create-element 'div', {}, ' Withdraw the staking amount'
            react.create-element 'div', {}, children = 
                amount-field { store, value: store.staking.withdrawAmount, on-change: change-max }
            button { store, text: "Withdraw", icon: 'exit', on-click: exit, type: "secondary" }
not-available-right-now = ->
    react.create-element 'div', { className: 'section' }, children = 
        react.create-element 'div', { className: 'title' }, children = 
            react.create-element 'h3', {}, ' Exit'
        react.create-element 'div', { className: 'description' }, children = 
            react.create-element 'div', {}, ' Not available right now. Please check later'
registry =
    \exit_ordered : order-withdraw-process
    \exit_order   : order-withdraw-process
    \exit_wait    : order-withdraw-process
    \exit         : fast-withdraw-process
    \exit_closed  : not-available-right-now
module.exports = (store, web3t)->
    func = registry[store.staking.exit-tab]
    return null if not func?
    func store, web3t
module.exports.init = ({ store, web3t}, cb)->
    store.staking.exit-tab = ''
    store.staking.maxWithdrawAllowed = 0
    store.staking.maxWithdrawOrderAllowed = 0
    store.staking.orderedWithdrawAmount = 0
    staking-address = store.staking.keystore.staking.address
    return cb null if not store.staking?chosen-pool?
    pool-address = store.staking.chosen-pool.address
    #console.log \ext-stake, staking-address, pool-address
    err, max <- web3t.velas.Staking.maxWithdrawAllowed(pool-address, staking-address)
    return cb err if err?
    store.staking.maxWithdrawAllowed = max.to-fixed! `div` (10^18)
    store.staking.withdrawAmount = store.staking.maxWithdrawAllowed if +store.staking.maxWithdrawAllowed > 0
    err, max <- web3t.velas.Staking.maxWithdrawOrderAllowed(pool-address, staking-address)
    return cb err if err?
    store.staking.maxWithdrawOrderAllowed = max.to-fixed! `div` (10^18)
    store.staking.withdrawAmount = store.staking.maxWithdrawOrderAllowed if +store.staking.maxWithdrawOrderAllowed > 0
    err, amount <- web3t.velas.Staking.orderedWithdrawAmount store.staking.chosen-pool.address, staking-address
    return cb err if err?
    store.staking.orderedWithdrawAmount = amount.to-fixed!
    err, last-epoch <- web3t.velas.Staking.orderWithdrawEpoch(store.staking.chosen-pool.address, staking-address)
    console.log "web3t.velas.Staking.orderWithdrawEpoch('#{store.staking.chosen-pool.address}', '#{staking-address}')"
    return cb "#{err}" if err?
    err, staking-epoch <- web3t.velas.Staking.stakingEpoch
    return cb "#{err}" if err?
    res = staking-epoch `minus` last-epoch
    store.staking.wait-for-epoch-change = if +res is 0 then yes else no
    store.staking.exit-tab =
        | +store.staking.maxWithdrawAllowed > 0 => \exit
        | +store.staking.orderedWithdrawAmount > 0 and store.staking.wait-for-epoch-change => \exit_wait
        | +store.staking.orderedWithdrawAmount > 0 => \exit_ordered
        | +store.staking.maxWithdrawOrderAllowed > 0 => \exit_order
        | +store.staking.stake-amount-total > 0 => \exit_closed
        | _ => ''
    cb null