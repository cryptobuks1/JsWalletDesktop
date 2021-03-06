require! {
    \react
    \../get-primary-info.ls
    \../round5.ls
    \../round.ls
    \prelude-ls : { find }
    \../math.ls : { times }
    \./keyboard.ls
}
# .input-area2078247576
#     position: relative
#     margin-top: 10px
#     width: 100%
#     box-sizing: border-box
#     height: 36px
#     line-height: 36px
#     >*
#         display: inline-block
#         box-sizing: border-box  
#         margin: 0 !important
#         height: inherit
#         line-height: inherit
#         vertical-align: top
#         z-index: 1
#     >input
#         display: inline-block
#         width: calc(100% - 70px) !important
#         padding: 0 10px
#     >.suffix
#         $color: rgba(#ccc, 0.3)
#         width: 70px
#         border-left: 1px solid $color
#         text-align: center
#         >*
#             display: inline-block
#         >.icon
#             width: 15px
#             margin-bottom: -3px
#             margin-right: 3px
#     >.show-details
#         display: none
#     &:hover
#         >.show-details
#             display: block
#             position: absolute
#             top: 36px
#             left: 0
#             width: 100%
#             padding: 0
#             color: white
#             height: 90px
#             text-align: right
#             background: transparent
#             >.panel
#                 padding: 10px
#                 background: rgba(black, 0.8)
#                 display: inline-block
#                 max-width: 250px
#                 min-width: 250px
#                 text-align: left
module.exports = ({ store, value, on-change, placeholder })->
    style = get-primary-info store
    input-style =
        background: style.app.wallet
        color: style.app.text
        overflow-x: \auto
    current=
        ref: null
    { wallets } = store.current.account
    wallet =
        wallets |> find (-> it.coin.token is \vlx2)
    usd = value `times` wallet.usd-rate
    eur = value `times` wallet.eur-rate
    actual-placeholder = placeholder ? ""
    value-vlx = value ? 0
    react.create-element 'div', { className: 'input-area input-area2078247576' }, children = 
        react.create-element 'input', { type: "text", value: "#{value-vlx}", style: input-style, on-change: on-change, placeholder: actual-placeholder }
        react.create-element 'span', { style: input-style, className: 'suffix' }, children = 
            react.create-element 'img', { src: "#{wallet.coin.image}", className: 'icon' }
            react.create-element 'span', {}, ' VLX2'
        react.create-element 'div', { className: 'show-details' }, children = 
            react.create-element 'div', { className: 'panel' }, children = 
                react.create-element 'div', {}, ' USD: ' + round usd
                react.create-element 'div', {}, ' EUR: ' + round eur