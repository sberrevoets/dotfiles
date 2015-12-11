$(document).ready(function() {
    if (document.URL.indexOf("lyft") < 0) {
        return;
    }

    showAdditionalCommentButtons();

    var observer = new WebKitMutationObserver(function(mutations, observer) {
        var button = $('#thumb-and-label-submit');
        if (button.length === 0) {
            showAdditionalCommentButtons();
        }
    });

    observer.observe(document, {
        subtree: true,
        attributes: true
    });
})

function createButton(title, handler) {
    var button = document.createElement('button');
    button.innerHTML = title;
    button.className = 'btn';
    button.setAttribute('id', 'thumb-and-label-submit');
    button.setAttribute('type', 'submit');
    button.setAttribute('style', 'margin: 0 30px 0 0');
    button.addEventListener('click', handler);
    return button;
}

function submitCommentAndAddLabel(event) {
    event.stopPropagation();

    // Enter and submit comment
    var commentForm = $('.js-new-comment-form');
    var textarea = commentForm.find('textarea');
    var currentValue = textarea.val();
    textarea.val(currentValue + ":+1:");

    // Add reviewer label
    var URL = document.URL.replace(/https:\/\/github.com\/lyft\//, "");
    var repoEndIndex = URL.indexOf("/")
    var repo = URL.substring(0, repoEndIndex)

    var pullRequestStartIndex = URL.lastIndexOf("/");
    var pullRequest = URL.substring(pullRequestStartIndex + 1);

    addLabelToPR("scott", repo, pullRequest)
}

function addLabelToPR(label, repo, pullRequest) {
    var requestURL = "https://api.github.com/repos/lyft/" + repo + "/issues/" + pullRequest + "/labels"

    $.ajax({
        type: "POST",
        url: requestURL,
        headers: { "Authorization": "token " + getGitHubToken() },
        data: "[\"" + label + "\"]",
    });
}

function insertButtons(element) {
    var button = createButton("👍🏻", submitCommentAndAddLabel);
    $('#partial-new-comment-form-actions').append(button);
}

function showAdditionalCommentButtons() {
    var lastBubble = $('.timeline-new-comment.js-comment-container').last();
    insertButtons(lastBubble);
}
