require! {
    \react
    \react-dom
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../icons.ls
    \../math.ls : { div, times, plus, minus }
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
max-withdraw-ordered = (store, web3t)->
    return null if not store.staking.chosen-pool?
    return null if +store.staking.stake-amount-total is 0 and +store.staking.withdraw-amount is 0
    style = get-primary-info store
    lang = get-lang store
    button-primary4-style=
        border: "1px solid #{style.app.primary4}"
        color: style.app.text
        background: style.app.primary4
    activate = (step)-> ->
        store.current.step = step 
    activate-first = activate \first
    activate-second = activate \second
    activate-third = activate \third
    active-class = (step)->
        active-tab =
            | +store.staking.withdraw-amount is 0 => \first
            | store.staking.wait-for-epoch-change is yes => \second
            | +store.staking.withdraw-amount > 0 => \third
        if active-tab is step then 'active' else ''
    active-first = active-class \first
    active-second = active-class \second
    active-third = active-class \third
    order = ->
        err, data <- web3t.velas.Staking.areStakeAndWithdrawAllowed!
        return cb err if err?
        return alert "Order is not allowed. Please wait for epoch change" if data isnt yes
        staking-address = store.staking.keystore.staking.address
        pool-address = store.staking.chosen-pool.address
        err, max <- web3t.velas.Staking.maxWithdrawOrderAllowed(pool-address, staking-address)
        amount = max.to-fixed!
        return alert "Request is not allowed. This may because the Staking epoch is changed" if +amount is 0
        data = web3t.velas.Staking.order-withdraw.get-data(pool-address, amount)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }        
    exit = ->
        #maxWithdrawOrderAllowed
        return alert "No Ordered Amount" if +store.staking.withdraw-amount is 0
        pool-address = store.staking.chosen-pool.address
        #staking-address = store.staking.keystore.staking.address
        data = web3t.velas.Staking.claimOrderedWithdraw.get-data(pool-address)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }
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
                                react.create-element 'button', { style: button-primary4-style, on-click: order }, children = 
                                    react.create-element 'span', {}, children = 
                                        react.create-element 'img', { src: "#{icons.exit}", className: 'icon-svg' }
                                        """ Request exit"""
                    react.create-element 'div', { on-click: activate-second, className: "#{active-second} step" }, children = 
                        react.create-element 'div', { className: 'step-count' }, ' 2'
                        react.create-element 'div', { className: 'step-content' }, ' Come back in 1.5 hours for a your staking amount'
                    react.create-element 'div', { on-click: activate-third, className: "#{active-third} step" }, children = 
                        react.create-element 'div', { className: 'step-count' }, ' 3'
                        react.create-element 'div', { className: 'step-content' }, children = 
                            react.create-element 'div', {}, ' Withdraw the staking amount'
                            if active-third is \active
                                react.create-element 'button', { style: button-primary4-style, on-click: exit }, children = 
                                    react.create-element 'span', {}, children = 
                                        react.create-element 'img', { src: "#{icons.exit}", className: 'icon-svg' }
                                        """ Withdraw"""
max-withdraw = (store, web3t)->
    return null if +store.staking.stake-amount-total is 0 and +store.staking.withdraw-amount is 0
    style = get-primary-info store
    lang = get-lang store
    button-primary4-style=
        border: "1px solid #{style.app.primary4}"
        color: style.app.text
        background: style.app.primary4
    exit = ->
        err, data <- web3t.velas.Staking.areStakeAndWithdrawAllowed!
        return cb err if err?
        return alert "Exit is not allowed. Please wait for epoch change" if data isnt yes
        staking-address = store.staking.keystore.staking.address
        pool-address = store.staking.chosen-pool.address
        err, max <- web3t.velas.Staking.maxWithdrawAllowed(pool-address, staking-address)
        amount = max.to-fixed!
        console.log "web3t.velas.Staking.maxWithdrawAllowed('#{pool-address}', '#{staking-address}')"
        return alert "Exit is not allowed. This may because the Staking epoch is changed" if +amount is 0
        data = web3t.velas.Staking.withdraw.get-data(pool-address, amount)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }        
    react.create-element 'div', { className: 'section' }, children = 
        react.create-element 'div', { className: 'title' }, children = 
            react.create-element 'h3', {}, ' Exit'
        react.create-element 'div', { className: 'description' }, children = 
            react.create-element 'div', {}, ' Withdraw the staking amount'
            react.create-element 'button', { style: button-primary4-style, on-click: exit }, children = 
                react.create-element 'span', {}, children = 
                    react.create-element 'img', { src: "#{icons.exit}", className: 'icon-svg' }
                    """ Withdraw"""
module.exports = (store, web3t)->
    if +store.staking.max-withdraw-ordered > 0 or +store.staking.withdraw-amount > 0
        max-withdraw-ordered store, web3t
    else 
        max-withdraw store, web3t