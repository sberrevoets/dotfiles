$(document).ready(function() {
    if (document.URL.indexOf("lyft") >= 0) {
        show_additional_comment_buttons();
    }
})

function create_button(title, handler) {
    var button = document.createElement('button');
    button.innerHTML = title;
    button.className = 'btn';
    button.setAttribute('type', 'submit');
    button.setAttribute('style', 'margin: 0 30px 0 0');
    button.addEventListener('click', handler);
    return button;
}

function submit_comment_and_add_label(event) {
    event.preventDefault();
    event.stopPropagation();

    // Enter and submit comment
    var commentForm = $('.js-new-comment-form');
    var textarea = commentForm.find('textarea');
    textarea.val(":+1:");
    commentForm.find('.btn-primary')[0].click();

    // Add reviewer label
    $('.sidebar-labels').find('button')[0].click();
    setTimeout(function() {
        $('input[type="checkbox"][value="scott"]')[0].click();
        $('body').click();
    }, 200);
}

function insert_buttons(element) {
    var button = create_button("👍🏻", submit_comment_and_add_label);
    $('#partial-new-comment-form-actions').append(button);
}

function show_additional_comment_buttons() {
    var lastBubble = $('.timeline-new-comment.js-comment-container').last();
    insert_buttons(lastBubble);
}
