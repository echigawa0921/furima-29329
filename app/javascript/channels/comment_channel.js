import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<tr>
                    <th class="comment-usernickname">${data.nickname}</th>
                    <td class="comment-list">${data.content.comment}</td>
                  </tr>`;
    const messages = document.getElementById('comment');
    const newMessage = document.getElementById('comment_comment');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
    document.querySelector('input[name="commit"]').disabled = false;
  }
});


