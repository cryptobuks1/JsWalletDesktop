require! {
    \react
    \../navigate.ls
    \./history.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \../icons.ls
}
# .sent-1181172205
#     .animation
#         height: 75px
#     .limited-history
#         margin-top: 20px
#         overflow: scroll
#         .table
#             height: calc(50vh - 60px)
#             margin-top: -1px
#         .nothin-to-show
#             top: 10%
#         button.back
#             display: none
#     .history
#         margin: 0
#     @import scheme
#     text-align: center
#     color: #5bb03e
#     padding-top: 100px
#     width: 100%
#     max-width: 540px
#     min-width: 320px
#     display: inline-block
#     .icon
#         text-align: center
#         fill: white
#         >svg
#             margin: 20px 0
#             display: inline-block
#             width: 52px
#             height: 52px
#             zoom: 2
#     .text
#         font-weight: 600
#     button
#         display: inline-block
#         margin-top: 20px
#         line-height: 36px
#         outline: none
#         margin-bottom: 5px
#         cursor: pointer
#         padding: 0 6px
#         box-sizing: border-box
#         border-radius: $border
#         font-size: 10px
#         width: 90px
#         height: 36px
#         color: #6CA7ED
#         text-transform: uppercase
#         font-weight: bold
#         transition: all .5s
#     .icon-sent
#         height: 50px
#         border-radius: 0
#         margin-bottom: 20px
#         animation: passing_1361 2s cubic-bezier(0, 0, 0.79, 0.04) 1
#         transform-origin: 50% 50%
#     .icon-svg
#         height: 12px
#         padding: 0px 5px 0 0px
#     @-webkit-keyframes passing_1361
#         0%
#             transform: translateY(0%)
#             opacity: 0
#         50%
#             transform: translateY(-30%)
#             opacity: 1
#         100%
#             transform: translateY(0%)
#             opacity: 1
#     @keyframes passing_1361
#         0%
#             transform: translateY(0%)
#             opacity: 0
#         50%
#             transform: translateY(-30%)
#             opacity: 1
#         100%
#             transform: translateY(0%)
#             opacity: 1
#     .show
#         -webkit-animation: seconds1 1.0s forwards
#         -webkit-animation-iteration-count: 1
#         -webkit-animation-delay: 2s
#         animation: seconds1 1.0s forwards
#         animation-iteration-count: 1
#         animation-delay: 2s
#         position: relative
#         opacity: 0
#     @-webkit-keyframes seconds1
#         0%
#             opacity: 0
#         100%
#             opacity: 1
#             position: relative
#     @keyframes seconds1
#         0%
#             opacity: 0
#         100%
#             opacity: 1
#             position: relative
#     .hide
#         -webkit-animation: seconds 1.0s forwards
#         -webkit-animation-iteration-count: 1
#         -webkit-animation-delay: 2s
#         animation: seconds 1.0s forwards
#         animation-iteration-count: 1
#         animation-delay: 2s
#         position: relative
#         top: -75px
#     @-webkit-keyframes seconds
#         0%
#             opacity: 1
#         100%
#             opacity: 0
#             left: -9999px
#             position: relative
#     @keyframes seconds
#         0%
#             opacity: 1
#         100%
#             opacity: 0
#             left: -9999px
#             position: relative
success-icon = (store)->
    style = get-primary-info store
    icon-style = 
        fill: style.app.icon
    react.create-element 'svg', { version: '1.1', xmlns: 'http://www.w3.org/2000/svg', x: '0px', y: '0px', viewbox: '0 0 52 52', style: icon-style }, children = 
        react.create-element 'g', {}, children = 
            react.create-element 'path', { d: 'M26,0C11.664,0,0,11.663,0,26s11.664,26,26,26s26-11.663,26-26S40.336,0,26,0z M26,50C12.767,50,2,39.233,2,26S12.767,2,26,2s24,10.767,24,24S39.233,50,26,50z' }
            react.create-element 'path', { d: 'M38.252,15.336l-15.369,17.29l-9.259-7.407c-0.43-0.345-1.061-0.274-1.405,0.156c-0.345,0.432-0.275,1.061,0.156,1.406l10,8C22.559,34.928,22.78,35,23,35c0.276,0,0.551-0.114,0.748-0.336l16-18c0.367-0.412,0.33-1.045-0.083-1.411C39.251,14.885,38.62,14.922,38.252,15.336z' }
        react.create-element 'g', {}
        react.create-element 'g', {}
        react.create-element 'g', {}
        react.create-element 'g', {}
        react.create-element 'g', {}
        react.create-element 'g', {}
        react.create-element 'g', {}
        react.create-element 'g', {}
        react.create-element 'g', {}
        react.create-element 'g', {}
        react.create-element 'g', {}
        react.create-element 'g', {}
        react.create-element 'g', {}
        react.create-element 'g', {}
        react.create-element 'g', {}
module.exports = ({ store, web3t })->
    style = get-primary-info store
    text-style=
        color: style.app.text
    button-primary3-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text2
        background: style.app.primary3
    link-style=
        color: style.app.text2
    sent-icon=
        filter: style.app.nothingIcon
    btn-icon =
        filter: style.app.btn-icon
    go-home = ->
        navigate store, web3t, \wallets
    lang = get-lang store
    react.create-element 'div', { className: 'sent sent-1181172205' }, children = 
        react.create-element 'div', { className: 'animation' }, children = 
            react.create-element 'div', { className: 'show' }, children = 
                react.create-element 'img', { src: "#{icons.sent-check}", className: 'icon-sent' }
            react.create-element 'div', { className: 'hide' }, children = 
                react.create-element 'img', { style: sent-icon, src: "#{icons.sent-plane}", className: 'icon-sent' }
        react.create-element 'div', { style: text-style, className: 'text' }, children = 
            react.create-element 'span', {}, ' ' + lang.your + ' '
            react.create-element 'a', { style: link-style, href: "#{store.current.last-tx-url}", target: "_blank" }, ' ' + lang.transaction ? 'transaction'
            react.create-element 'span', {}, '  ' + lang.has-been-sent ? 'has been sent'
        react.create-element 'button', { on-click: go-home, style: button-primary3-style, className: 'button' }, children = 
            react.create-element 'span', {}, children = 
                react.create-element 'img', { src: "#{icons.home}", style: btn-icon, className: 'icon-svg' }
                """ #{lang.home ? 'Home'}"""
        react.create-element 'div', { className: 'limited-history' }, children = 
            history { store, web3t }