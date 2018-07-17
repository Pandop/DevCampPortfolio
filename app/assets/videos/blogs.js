jQuery(document).on('turbolinks:load', function() {
    var comments = $('#comments');
    //console.log(comment);
    //var comments = document.querySelectorAll('#comments');
    console.log(comments);
    if (comments.length > 0) {
        App.global_chat = App.cable.subscriptions.create({
            channel: "BlogsChannel",
            blog_id: comments.data('blog-id') /*comments[0].dataset.blogId */
        }, {
            connected: function() {},
            disconnected: function() {},
            received: function(data) { return comments.append(data['comment']) },
            send_comment: function(comment, blog_id) {
                this.perform('send_comment', { comment: comment, blog_id: blog_id });

            }
        });
    }
    //document.querySelector('#new_comment').addEventListener('submit', function(e) 
    //document.querySelector("#new_comment").addEventListener("submit", function(e) 
    $('#new_comment').submit(function(e) {

        var $this = $(this)
        var textarea = $this.find('#comment_content');
        if ($.trim(textarea.val()).length > 1) {
            //alert('Hiiiii');
            App.global_chat.send_comment(textarea.val(), comments.data('blog-id') /*comments[0].dataset.blogId */ );

            textarea.val('')
        }
        e.preventDefault()
        return false
    });
});

/*
var comments = document.getElementById('comments');
if (comments != null) {
    App.global_chat = App.cable.subscriptions.create("BlogsChannel", +comments.data('blog-id'), {
        connected: function() {},
        disconnected: function() {},
        received: function(data) { return comments.append(data['comment']); },
        transmit: function(comment, blog_id) {}
    });
}
// Listen for submit event and handle it
document.querySelector('#new_comment').addEventListener('submit', function(e) {
    // send data if form is not empty
    var textarea = this.find('#comment_content');
    if (textarea.trim(' ').length > 0) {
        App.global_chat.transmit(textarea.value, comments[0].dataset.blogId);
        textarea.value = '';
    }
    e.preventDefault();
    return false;
});*/