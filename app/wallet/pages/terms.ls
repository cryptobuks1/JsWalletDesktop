require! {
    \react
    \superagent : { get }
    \../navigate.ls
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
}
# .terms1320611139
#     text-align: center
#     .terms-body
#         >.header
#             font-size: 19px
#             padding: 10px
#         display: inline-block
#         min-width: 250px
#         >.buttons
#             color: inherit
#             text-align: center
#             button
#                 display: inline-block
#                 cursor: pointer
#                 width: auto
#                 margin: 15px 5px 0
#                 text-transform: uppercase
#                 font-weight: 600
#                 padding: 10px 6px
#                 border: 0
#                 background: #248295
#                 border-radius: 7px
#                 font-size: 12px
#         textarea
#             padding: 10px
#             width: 100%
#             box-sizing: border-box
#             height: 250px
#             border: 0
#             border-radius: 5px
#             outline: none
terms = ({ store, web3t })->
    lang = get-lang store
    info = get-primary-info store
    style=
        background: info.app.wallet
        color: info.app.text
    button-style=
        color: info.app.text
    button-primary1-style=
        border: "1px solid #{info.app.border}"
        color: info.app.text
        background: info.app.primary1
    accept = ->
        navigate store, web3t, \:init
        <- web3t.refresh
    react.create-element 'div', { className: 'terms terms1320611139' }, children = 
        react.create-element 'div', { className: 'terms-body' }, children = 
            react.create-element 'div', { className: 'header' }, ' Terms of Use'
            react.create-element 'textarea', { value: "#{store.terms}", style: style }
            react.create-element 'div', { className: 'buttons' }, children = 
                react.create-element 'div', {}, ' ' + lang.terms ? 'Please accept terms of use'
                react.create-element 'button', { on-click: accept, style: button-primary1-style }, ' ' + lang.accept ? 'Accept'
terms.init = ({ store }, cb)->
    err, res <- get \https://raw.githubusercontent.com/web3space/wallet/master/TERMS.md .end
    return cb err if err?
    store.terms = res.text
    cb null
module.exports = terms