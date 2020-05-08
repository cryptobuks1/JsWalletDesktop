require! {
    \react
    \./wallet.ls
    \prelude-ls : { map, take, drop, filter }
    \../math.ls : { div, times, plus, minus }
    \./menu.ls
    \../seed.ls : { get }
    \../web3.ls
    \../wallets-funcs.ls
    \./manage-account.ls
    \./token-migration.ls
    \./add-coin.ls : add-coin-page
    \../get-lang.ls
    \../get-primary-info.ls
    \./history.ls
    \./your-account.ls
    \./icon.ls
    \localStorage
    \../icons.ls
    \moment
    \../navigate.ls
}
# .choose-account2040873820
#     @import scheme
#     $real-height: 300px
#     $cards-height: 296px
#     $pad: 20px
#     $radius: 15px    
#     height: auto
#     box-sizing: border-box
#     position: relative
#     right: 10px
#     bottom: 30px
#     $cards-pad: 15px
#     z-index: 2
#     .icon-svg-edit
#         height: 15px
#     .icon-svg-create
#         height: 9px
#     .switch-menu
#         right: -20px !important
#         top: 39px !important
#     .epoch
#         position: absolute
#         right: 180px
#         top: 39px
#         width: 170px
#         background: #321260
#         display: inline-grid
#         z-index: 3
#         box-shadow: 0px 13px 20px 0px rgba(0, 0, 0, 0.15)
#         .folder-menu
#             width: 100%
#             span
#                 font-size: 10px
#                 text-transform: uppercase
#                 opacity: .8
#             div
#                 text-overflow: ellipsis
#                 white-space: nowrap
#                 overflow: hidden
#                 font-size: 12px
#                 text-transform: uppercase
#                 letter-spacing: 2px
#             progress
#                 width: 100%
#         .col
#             font-size: 12px
#             padding: 10px
#             margin: 0
#             display: inline-block
#             vertical-align: top
#             box-sizing: border-box
#             overflow-y: hidden
#             &.folder-menu
#                 text-align: left
#                 display: inline-block
#                 span
#                     margin-right: 10px
#         .table-row-menu
#             text-align: left
#             &:hover
#                 cursor: default
#                 background: transparent
#         .middle
#             padding: 10px
#             .buttons
#                 padding: 0
#                 width: 100%
#                 button
#                     outline: none
#                     cursor: pointer
#                     border: 1px solid
#                     padding: 0
#                     box-sizing: border-box
#                     border-radius: $border
#                     font-size: 10px
#                     padding: 0 6px
#                     height: 36px
#                     color: #6CA7ED
#                     text-transform: uppercase
#                     font-weight: bold
#                     background: transparent
#                     transition: all .5s
#                     text-overflow: ellipsis
#                     overflow: hidden
#                     width: 100%
#                     margin: 0 auto
#                     opacity: 1
#                     img
#                     &.icon-svg
#                         position: relative
#                         height: 12px
#                         top: 2px
#                         padding-right: 5px
#     .header 
#         &:after
#             position: absolute
#             font-weight: bold
#             font-size: 40px
#             opacity: .05
#             top: 20px
#             left: -5px
#         .hidden
#             @media(max-width: 940px)
#                 visibility: hidden
#     .current-epoch
#         float: right
#         line-height: 18px
#         width: auto
#         top: 0px
#         right: 180px
#         position: absolute
#         text-align: right
#         display: block
#         z-index: 2
#         @media(max-width: 620px)
#             .name, .icon
#                 visibility: hidden
#             &.show
#                 .name, .icon
#                     visibility: visible
#         @media(max-width: 620px)
#             right: 220px
#         @media(max-width: 500px)
#             right: 180px
#         .ckeck
#             color: #3cd5af
#         .cancel
#             color: #c25b5f
#         .name
#             text-overflow: ellipsis
#             white-space: nowrap
#             overflow: hidden
#             width: 110px
#             text-align: right
#             cursor: default
#             display: inline-block
#             vertical-align: middle
#         input
#             outline: none
#             width: 100px
#             margin-top: -10px
#             height: 36px
#             line-height: 36px
#             border-radius: 0px
#             padding: 0px 10px
#             font-size: 12px
#             opacity: 1
#         span
#             cursor: pointer
#         .icon
#             vertical-align: middle
#             margin-left: 20px
#             transition: transform .5s
#             display: inline-block
#             &.rotate
#                 transform: rotate(180deg)
#                 transition: transform .5s
#                 display: inline-block
#     .h1
#         font-size: 12px
#         text-transform: uppercase
#         letter-spacing: 2px
#         opacity: .8
#     .your-account
#         position: absolute
#         width: auto
#         display: inline-block
#         right: 0
#         top: 0
#         padding: 12px 20px
#         border-left: 0
#         >.buttons
#             display: none !important
#         .buttons
#             >.button
#                 width: 20px
#                 padding: 0
#                 outline: none
#     >*
#         width: 100%
#     >.arrow
#         position: absolute
#         text-align: center
#         cursor: pointer
#         &.arrow-t
#             top: 0
#             margin-top: 10px
#         &.arrow-d
#             bottom: 0
#             margin-bottom: 10px
#             transform: rotate(180deg)
#         &:not(.true)
#             >.arrow-d
#                 visibility: hidden
#         >.arrow-container
#             display: inline-block
#             width: 100%
#             max-width: 450px
#             position: relative
#     >.wallet-container
#         overflow: hidden
#         overflow-y: auto
#         height: 300px
#         width: 100%
#         border-top: 1px solid #213040
#         display: inline-block
module.exports = (store, web3t)->
    return null if not store.current.account?
    { wallets, go-up, can-up, go-down, can-down } = wallets-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    border-style =
        border-top: "1px solid #{style.app.border}"
    header-style =
        border-top: "1px solid #{style.app.border}"
        padding: "17px 0px 20px"
        color: style.app.text
        text-align: "left"
    input=
        background: style.app.wallet
        border: "1px solid #{style.app.border}"
        color: style.app.text
    header-left =
        margin-left: "10px"
    filter-body =
        border: "1px solid #{style.app.border}"
        background: style.app.header
    border-right=
        border-right: "1px solid #{style.app.border}"
    under-dev=
        font-size: "11px"
        color: "orange"
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
        margin: "0"
        width: "100%"
    open-epoch = ->
        cb = alert
        store.current.current-epoch = not store.current.current-epoch
        return if not store.current.current-epoch
        err, staking-epoch <- web3t.velas.Staking.stakingEpoch
        return cb "#{err}" if err?
        err, next-block <- web3t.velas.Staking.stakingEpochEndBlock
        return cb err if err?
        err, start-block <- web3t.velas.Staking.stakingEpochStartBlock
        return cb err if err?
        err, current-block <- web3t.velas.web3.getBlockNumber
        return cb err if err?
        seconds = (next-block `minus` current-block) `times` 5
        all = (next-block `minus` start-block) `times` 5
        rest = all `minus` seconds
        console.log store.dashboard.epoch-percent , all, seconds
        store.dashboard.epoch-percent = 100 - ( 100 `div` all ) `times` seconds
        store.dashboard.epoch-next = moment!.add(seconds, 'seconds').from-now!
        store.dashboard.current-block = current-block
        store.dashboard.epoch = staking-epoch.to-fixed!
    edit-account-name = ->
        store.current.edit-account-name = current-account-name!
    default-account-name = -> "Account #{store.current.account-index}"
    edit-account = (e)->
        store.current.edit-account-name = e.target.value
    done-edit = ->
        local-storage.set-item default-account-name!, store.current.edit-account-name
        cancel-edit-account-name!
    cancel-edit-account-name = ->
        store.current.edit-account-name = ""
    current-account-name = ->
        local-storage.get-item(default-account-name!) ? default-account-name!
    account-name = current-account-name!
    rotate-class =
        if store.current.current-epoch then \rotate else \ ""
    current-block = store.dashboard.current-block ? 'loading...'
    epoch-next = store.dashboard.epoch-next ? 'loading...'
    monitor = ->
        navigate store, web3t, \monitor
    show-class =
        if store.current.open-menu then \show else \ ""
    open-menu = ->
        store.current.open-menu = not store.current.open-menu
    on-exit = ->
        store.current.current-epoch = no
    react.create-element 'div', { className: 'choose-account choose-account2040873820' }, children = 
        react.create-element 'div', { className: "#{show-class} current-epoch h1" }, children = 
            react.create-element 'span', { on-click: open-epoch, className: 'name' }, ' Epoch'
            react.create-element 'span', { on-click: open-epoch, className: "#{rotate-class} icon" }, children = 
                react.create-element 'img', { src: "#{icons.arrow-down}", className: 'icon-svg-create' }
        if store.current.current-epoch
            react.create-element 'div', { style: filter-body, on-mouse-leave: on-exit, className: 'epoch' }, children = 
                react.create-element 'div', { className: 'middle account' }, children = 
                    react.create-element 'div', { className: 'table-row-menu' }, children = 
                        react.create-element 'div', { className: 'col folder-menu' }, children = 
                            react.create-element 'div', {}, ' ' + current-block
                            react.create-element 'span', {}, ' Current block'
                        react.create-element 'div', { className: 'col folder-menu' }, children = 
                            react.create-element 'div', {}, ' ' + store.dashboard.epoch
                            react.create-element 'span', {}, ' Current epoch'
                        react.create-element 'div', { className: 'col folder-menu' }, children = 
                            react.create-element 'div', {}, children = 
                                react.create-element 'progress', { value: "#{store.dashboard.epoch-percent}", max: "100" }
                            react.create-element 'span', {}, ' Change ' + epoch-next
                        if window.location.href.index-of('internal') > -1
                            react.create-element 'div', { className: 'col folder-menu' }, children = 
                                react.create-element 'div', {}, children = 
                                    react.create-element 'button', { on-click: monitor, style: button-primary2-style }, children = 
                                        react.create-element 'span', {}, children = 
                                            react.create-element 'img', { src: "#{icons.monitor}", className: 'icon-svg' }
                                            """ Monitor"""