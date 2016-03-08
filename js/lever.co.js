$(document).on('keydown', '.card-form textarea', function(e) {
    if (e.keyCode == 13 && (e.metaKey || e.ctrlKey)) {
        $(this).parents('form').find(':submit').click()
    }
})
