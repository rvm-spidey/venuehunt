import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="new-msg-notif"
export default class extends Controller {

  static values = { chatroomId: Number,currentUserId: Number, updatenewmsg: Boolean }
  static targets = ["messages"]

  connect() {
    console.log("connected");
    const notif = document.getElementById("notif");

    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data =>  {
        this.messagesTarget.innerHTML = `<strong> ${data.msgcontent} </strong>`
        console.log("updatenewmsg", this.updatenewmsgValue);
        console.log("data.sender_id ", data.sender_id, " currentUserIdValue",this.currentUserIdValue );
        console.log("data.sender_id != this.currentUserIdValue ", data.sender_id != this.currentUserIdValue );

        if (data.sender_id !== this.currentUserIdValue) {
            notif.classList.add("notification");
        }
        }
      }
    )
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
