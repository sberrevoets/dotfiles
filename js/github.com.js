$(document).ready(function() {
    if (currentRepoOwner() == 'lyft') {
        setTimeout(showAdditionalCommentButtons, 1500);
    }

    hideUnwantedElements();
})

function currentRepoOwner() {
    var URL = document.URL.replace('https://github.com/', '');
    var ownerEndIndex = URL.indexOf('/');
    return URL.substring(0, ownerEndIndex);
}

function createButton(title, handler) {
    var button = document.createElement('button');
    button.innerHTML = title;
    button.className = 'btn';
    button.setAttribute('id', 'thumb-and-label-submit');
    button.setAttribute('style', 'margin: 0 30px 0 0');
    button.addEventListener('click', handler);
    return button;
}

function submitCommentAndAssignToMe(event) {
    event.stopPropagation();
    event.preventDefault();

    var URL = document.URL.replace('https://github.com/' + currentRepoOwner() + '/', '');
    var repoEndIndex = URL.indexOf('/')
    var repo = URL.substring(0, repoEndIndex)

    var commentForm = $('.js-new-comment-form');
    var textarea = commentForm.find('textarea');
    var comment = textarea.val();
    textarea.value = '';

    var pullRequestStartIndex = URL.lastIndexOf('/');
    var pullRequest = URL.substring(pullRequestStartIndex + 1);

    addCommentToPR(comment + ':+1:', repo, pullRequest);
    assignPR('sberrevoets', repo, pullRequest);
}

function addCommentToPR(comment, repo, pullRequest) {
    var requestURL = 'https://api.github.com/repos/' + currentRepoOwner() + '/' + repo +'/issues/' + pullRequest + '/comments'

    $.ajax({
        type: 'POST',
        url: requestURL,
        headers: { 'Authorization': 'token ' + getGitHubToken() },
        data: '{ \"body\": \"' + comment + '\" }',
    });
}

function assignPR(assignee, repo, pullRequest) {
    var requestURL = 'https://api.github.com/repos/' + currentRepoOwner() + '/' + repo + '/issues/' + pullRequest + '/assignees'

    $.ajax({
        type: 'POST',
        url: requestURL,
        headers: {
            'Authorization': 'token ' + getGitHubToken(),
            'Accept': 'application/vnd.github.cerberus-preview+json' // https://developer.github.com/changes/2016-5-27-multiple-assignees/
        },
        data: '{ \"assignees\": [\"' + assignee + '\"] }',
    });
}

function insertButtons(element) {
    var button = createButton('👍🏻', submitCommentAndAssignToMe);
    $('#partial-new-comment-form-actions').append(button);
}

function showAdditionalCommentButtons() {
    var lastBubble = $('.timeline-new-comment.js-comment-container').last();
    insertButtons(lastBubble);
}

function hideUnwantedElements() {
    $('.protip').hide();
    $('.subscribe-feed').hide();
}
