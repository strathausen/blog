#
# Ajax navigation drop-in; just load it and go!
# @author Pim Elshoff <pim@pelshoff.com>
# modified by JP Strathausen@gmail.com
#
class window.AjaxNavigator
  constructor: (@replacementSelectors) ->
    @popped = try
        'state' in window.history
      catch e
        false
    @initialURL = location.href
    @registerEventHandlers()

  navigate: (url) =>
    ($ @).trigger 'unload'
    $.get url, @navigateCallback

  registerEventHandlers: =>
    ($ window).on 'popstate', @popstateHandler
    ($ document).on 'click', 'a[href^="/"]', @clickHandler

    # Cheating time! Use mousedown to make it appear snappier. Awesomeness!
    #($ document).on 'mousedown', 'a[href^="/"]', @clickHandler

  clickHandler: (e) =>
    # is the ctrl key being hold?
    # then it is time to say good bye, and let the world be as it is...
    return if e.ctrlKey or e.shiftKey
    
    url = e.currentTarget.href
    history.pushState {url}, '', url
    @navigate url
    e.preventDefault()

  popstateHandler: (e) =>
    return if not @popped and location.href is @initialURL
    @popped = true
    @navigate e.originalEvent.state.url or location.href

  navigateCallback: (res) =>
    @replaceTitle res
    @replaceCSS res
    @replaceContent $ res
    ($ @).trigger 'load'

  replaceTitle: (res) ->
    document.title = (res.match /<title>(.*?)<\/title>/)[1] ? document.title

  replaceCSS: (res) ->
    ($ ($ 'style')[0]).html (res.match /<style(.|\n)*<\/style>/g)[0]
      .replace /(<style(.*)>|<\/style>)/g, ''

  replaceContent: (res) ->
    ($ sel).html (res.find sel).children() for sel in @replacementSelectors
    undefined
