Template.i18n_dropdown_semantic.rendered = ->
  $('select.dropdown').dropdown()

Template.i18n_dropdown_semantic.events
  # set language to selected option's tag
  'change .tap-i18n-dropdown select' : (e) -> TAPi18n.setLanguageAmplify $(e.currentTarget).val()

Template.i18n_buttons_semantic.events
  # set language to context tag
  'click .tap-i18n-buttons button' : (e,tmpl) -> TAPi18n.setLanguageAmplify @tag

Template.i18n_flags_semantic.events
  'click .tap-i18n-flags .flag' : (e,tmpl) ->
    TAPi18n.setLanguageAmplify @tag

flagTagMap =
  'en': 'gb'
  'zh': 'cn'
  'ja': 'jp'

Template.i18n_flags_semantic.helpers
  sortedFlagTags: ->
    sortedLanguages = TAPi18n.uiHelpers.sortedLanguages()
    return sortedLanguages.map (obj) ->
      obj.flagTag = flagTagMap[obj.tag] || obj.tag
      return obj
