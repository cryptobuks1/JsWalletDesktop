require! {
    \react
    \./project-links.ls
    \../menu-funcs.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \./loading.ls
    \../navigate.ls
    \../setup-pages.ls
    \../icons.ls
}
# .mobile-menu-103036460
#     &.active
#         width: 100%
#         height: 100vh
#         position: fixed
#         z-index: 11
#         background: rgba(black, 0.4)
#         top: 0
#         right: 0
#         z-index: 12
#         transition: all .5s
#     .content
#         width: 200px
#         text-align: right
#         padding: 50px 40px
#         box-sizing: border-box
#         height: calc(100vh - 0px)
#         position: fixed
#         z-index: 111
#         $smooth: color .15s ease-in-out
#         top: 0px
#         right: -500px
#         transition: all .5s
#         box-shadow: -10px 0px 40px 10px rgba(0, 0, 0, 0.25)
#         .closed
#             position: absolute
#             padding: 10px 20px
#             font-size: 20px
#             right: 0
#             top: 0
#             cursor: pointer
#             &:hover
#                 svg
#                     transform: rotate(90deg)
#                     transition: all .5s
#             svg
#                 transition: all .5s
#         &.active
#             right: 0px
#             transition: all .5s
#         &.show
#             .menu-item
#                 display: inline-block
#                 &.menu-btn
#                     opacity: .5
#                     transition: all .5s
#         .logo
#             position: absolute
#             width: auto
#             text-align: left
#             left: 15px
#             img
#                 width: 25px
#                 vertical-align: bottom
#         >.menu-item
#             &.active
#                 color: #9264b6 !important
#                 transition: $smooth
#                 -webkit-transition: $smooth
#                 -moz-transition: $smooth
#                 -ms-transition: $smooth
#                 -o-transition: $smooth
#                 img
#                     filter: grayscale(100%) brightness(40%) sepia(120%) hue-rotate(-140deg) saturate(790%) contrast(0.5)
#             &.syncing
#                 @keyframes spin
#                     from
#                         transform: rotate(0deg)
#                     to 
#                         transform: rotate(360deg)
#                 animation-name: spin
#                 animation-duration: 4000ms
#                 animation-iteration-count: infinite
#                 animation-timing-function: linear
#             cursor: pointer
#             opacity: 0.9
#             &:hover
#                 opacity: 1
#             vertical-align: text-top
#             line-height: normal
#             display: inline-block
#             margin-left: 20px
#             position: relative
#             height: 20px
#             line-height: 15px
#             width: 20px
#             text-align: center
#             z-index: 11
#             img
#                 width: 17px
#                 border-radius: 0px
#                 position: absolute
#                 left: 0
#                 padding: 2px
#                 height: 17px
#         .langs-menu
#             width: auto
#             background: #45217e
#             position: absolute
#             top: 59px
#             right: 5rem
#             display: inline-grid
#             z-index: 1
#             padding: 15px
#             z-index: 11
#             .langs-item
#                 display: inline-flex
#                 cursor: pointer
#                 line-height: 20px
#                 margin-bottom: 15px
#                 &:last-child
#                     margin-bottom: 0
#                 img
#                     width: 20px
#                     height: 20px
#                     border-radius: 20px
#                 span
#                     margin-left: 10px
#         .iron
#             -webkit-mask-image: linear-gradient(75deg, rgba(0, 0, 0, 0.6) 30%, #000 50%, rgba(0, 0, 0, 0.6) 70%)
#             -webkit-mask-size: 50%
#             animation: shine 2s infinite
#         @keyframes shine
#             0%
#                 -webkit-mask-position: right
#             100%
#                 -webkit-mask-position: left
#         .menu-item
#             &:hover
#                 .plus
#                     svg
#                         transform: rotate(45deg)
#             .plus, .dash
#                 svg
#                     position: absolute
#                     right: -116px
#                     top: 21px
#                     width: 10px
#                     transition: all .5s
#             .plus
#                 svg
#                     transform: rotate(45deg)
#                     opacity: 1
#             .dash
#                 svg
#                     opacity: 0
#             &.active
#                 .dash
#                     svg
#                         opacity: 1
#                         transition: all .5s
#                 .plus
#                     svg
#                         opacity: 0
#                         transition: all .5s
#             span
#                 opacity: 0
#                 position: absolute
#                 left: 0
#             svg, img
#                 transition: transform .5s
#             .menu
#                 opacity: 0
#                 position: absolute
#                 top: -400px
#             &.submenu
#                 &.active
#                     height: auto
#                 .menu
#                     text-transform: uppercase
#                     z-index: 1
#                     top: 0
#                     height: auto
#                     width: 140px
#                     font-size: 10px
#                     color: #fff
#                     padding: 20px 0 10px 25px
#                     opacity: 1
#                     transition: opacity .5s
#                     ul
#                         list-style: none
#                         padding: 0
#                         text-align: left
#                         margin: 0
#                         li
#                             &:hover
#                                 color: #9264b6 !important
#                                 transition: .5s
#                                 img
#                                     filter: grayscale(100%) brightness(40%) sepia(120%) hue-rotate(-140deg) saturate(790%) contrast(0.5)
#                                     transition: .5s
#                             margin-bottom: 25px
#                             font-size: 12px
#                             &:last-child
#                                 margin-bottom: 0
#                             &.active
#                                 color: #9264b6 !important
#                                 img
#                                     filter: grayscale(100%) brightness(40%) sepia(120%) hue-rotate(-140deg) saturate(790%) contrast(0.5)
#                             img
#                                 filter: none
#                     &.arrow_box
#                         border: 0
#                         position: relative
#             &:hover
#                 svg, img
#                     transform: scale(1)
#                     transition: transform .5s
#                 span
#                     position: absolute
#                     text-transform: uppercase
#                     left: 70px
#                     top: 17px
#                     font-size: 10px
#                     font-weight: 600
#                     color: #fff
#                     padding: 5px
#                     background: #210b4a
#                     opacity: 1
#                     transition: opacity .5s
#                     &.arrow_box
#                         border: 1px solid #6b268e
#                         &:after, &:before
#                             right: 100%
#                             top: 21%
#                             border: solid transparent
#                             content: " "
#                             height: 0
#                             width: 0
#                             position: absolute
#                             pointer-events: none
#                         &:after
#                             border-color: rgba(136, 183, 213, 0)
#                             border-right-color: #210b4a
#                             border-width: 6px
#                             margin-top: 2px
#                         &:before
#                             border-color: rgba(194, 225, 245, 0)
#                             border-right-color: #6b268e
#                             border-width: 8px
#                             margin-top: 0px
#             &.active
#                 color: #9264b6 !important
#                 transition: $smooth
#                 -webkit-transition: $smooth
#                 -moz-transition: $smooth
#                 -ms-transition: $smooth
#                 -o-transition: $smooth
#                 img
#                     filter: grayscale(100%) brightness(40%) sepia(120%) hue-rotate(-140deg) saturate(790%) contrast(0.5)
#             &.syncing
#                 @keyframes spin
#                     from
#                         transform: rotate(0deg)
#                     to 
#                         transform: rotate(360deg)
#                 animation-name: spin
#                 animation-duration: 4000ms
#                 animation-iteration-count: infinite
#                 animation-timing-function: linear
#             cursor: pointer
#             opacity: 0.9
#             &:hover
#                 opacity: 1
#             vertical-align: bottom
#             line-height: normal
#             display: block
#             margin-left: 0px
#             position: relative
#             height: 40px
#             line-height: 15px
#             padding-top: 20px
#             width: 20px
#             text-align: center
#             z-index: 11
#             label
#                 font-size: 12px
#                 text-transform: uppercase
#                 letter-spacing: 2px
#                 line-height: 24px
#                 opacity: .8
#                 margin-left: 30px
#                 cursor: pointer
#             &.menu-btn, &.locked
#                 display: inline-block
#             &.class
#                 position: absolute
#                 top: 530px
#                 left: 0
#                 color: transparent !important
module.exports = (store, web3)->
    #return null if not store? or store.current.page in <[ locked ]>
    return null if not store? or store.current.page in setup-pages
    { current, open-account, lock, wallet-style, info, activate-s1, activate-s2, activate-s3, switch-network, refresh, lock } = menu-funcs store, web3t
    style = get-primary-info store
    wallets = if store.current.page is \wallets then \active else \not-active
    search = if store.current.page is \search then \active else \not-active
    settings = if store.current.page is \settings then \active else \not-active
    filestorage = if store.current.page is \filestorage then \active else \not-active
    staking = if store.current.page is \staking then \active else \not-active
    resources = if store.current.page is \resources then \active else \not-active
    staking-active = if store.current.page is \staking then \active else \not-active
    delegate-active = if store.current.page is \choosestaker then \active else \not-active
    info-active = if store.current.page is \info then \active else \not-active
    menu-style=
        color: style.app.text
    icon-style =
        color: style.app.icon
    lock-style =
        color: style.app.icon
        bottom: "30px"
        position: "absolute"
    lang = get-lang store
    info = get-primary-info store
    syncing = 
        | store.current.refreshing => "syncing"
        | _ => ""
    border-style =
        background: style.app.menu
    logo-style =
        filter: style.app.filterLogo
    expand-collapse = ->
        store.current.langs-open = not store.current.langs-open
    langs-menu-body =
        border: "1px solid #{style.app.border}"
        background: style.app.header
    wallet-icon = 
        width: "18px"
    comming-soon =
        opacity: ".3"
        cursor: "no-drop"
    icon-node =
        position: "inherit"
        vertical-align: "sub"
        width: "12px"
        height: "12px"
        padding-right: "10px"
    lock-icon = 
        width: "14px"
    text-style=
        color: style.app.text
    goto-settings = ->
        store.menu.show = no
        navigate store, web3t, \settings
    goto-search = ->
        navigate store, web3t, \search
        store.menu.show = no
    wallet = ->
        navigate store, web3t, \wallets
        store.menu.show = no
    goto-staking = ->
        navigate store, web3t, \staking
        store.menu.show = no
    goto-choose-staker = ->
        navigate store, web3t, \choosestaker
        store.menu.show = no
    goto-info = ->
        navigate store, web3t, \info
        store.menu.show = no
    lock = ->
        navigate store, web3t, \locked
        store.menu.show = no
    open-submenu = ->
        store.current.submenu = not store.current.submenu
    menu-staking =
        if store.current.submenu then \submenu else \ ''
    menu-out = ->
        store.current.submenu = no
    staking = if store.current.submenu then \active else \not-active
    show-mobile =
        if store.menu.show then \active else \ ""
    close = ->
        store.menu.show = no
    react.create-element 'div', { className: "#{show-mobile} mobile-menu mobile-menu-103036460" }, children = 
        react.create-element 'div', { style: border-style, className: "#{show-mobile} content" }, children = 
            react.create-element 'div', { on-click: close, className: 'closed' }, children = 
                icon \X, 20
            if store.preference.settings-visible is yes
                if store.current.device is \mobile
                    react.create-element 'div', { on-click: wallet, style: icon-style, className: "#{wallets} menu-item" }, children = 
                        react.create-element 'img', { src: "#{icons.wallet}", style: wallet-icon }
                        react.create-element 'label', {}, ' Wallets'
            if store.preference.settings-visible is yes
                if store.current.device is \mobile
                    react.create-element 'div', { on-click: open-submenu, style: icon-style, className: "#{staking + ' ' + menu-staking} menu-item" }, children = 
                        react.create-element 'div', { className: 'plus' }, children = 
                            icon \X, 20
                        react.create-element 'div', { className: 'dash' }, children = 
                            icon \Dash, 20
                        react.create-element 'img', { src: "#{icons.staking}" }
                        react.create-element 'label', {}, ' Staking'
                        react.create-element 'div', { className: 'menu arrow_box' }, children = 
                            react.create-element 'ul', {}, children = 
                                react.create-element 'li', { on-click: goto-staking, style: icon-style, className: "#{staking-active}" }, children = 
                                    react.create-element 'img', { src: "#{icons.node}", style: icon-node }
                                    """ Node"""
                                react.create-element 'li', { on-click: goto-choose-staker, style: icon-style, className: "#{delegate-active}" }, children = 
                                    react.create-element 'img', { src: "#{icons.delegate}", style: icon-node }
                                    """ Delegate"""
                                react.create-element 'li', { on-click: goto-info, style: icon-style, className: "#{info-active}" }, children = 
                                    react.create-element 'img', { src: "#{icons.info}", style: icon-node }
                                    """ Stats"""
            if store.preference.settings-visible is yes
                if store.current.device is \mobile
                    react.create-element 'div', { on-click: goto-search, style: icon-style, className: "#{search} menu-item" }, children = 
                        react.create-element 'img', { src: "#{icons.search}" }
                        react.create-element 'label', {}, ' Search'
            if store.preference.settings-visible is yes
                if store.current.device is \mobile
                    react.create-element 'div', { on-click: goto-settings, style: icon-style, className: "#{settings} menu-item" }, children = 
                        react.create-element 'img', { src: "#{icons.setting}" }
                        react.create-element 'label', {}, ' Settings'
            if store.preference.lock-visible is yes
                if store.current.device is \mobile    
                    react.create-element 'div', { on-click: lock, style: lock-style, className: 'menu-item' }, children = 
                        react.create-element 'img', { src: "#{icons.lock}", style: lock-icon }
                        react.create-element 'label', {}, ' Locked'