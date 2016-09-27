$ ->
  $('.bbs-comments').infinitescroll
    loading:
      finishedMsg: '',
      msgText: '',
    navSelector: 'nav.pagination',
    nextSelector: 'nav.pagination a[rel=next]',
    itemSelector: '.bbs-comments .bbs-article'
