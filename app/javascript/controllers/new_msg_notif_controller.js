import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="new-msg-notif"
export default class extends Controller {

  static values = { chatroomId: Number, currentuser: Number, msguser: Number, currentUserId: Number }
  static targets = ["messages"]

  connect() {
    console.log("connected");
    const notif = document.getElementById("notif");

    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data =>  {
        console.log("data global", data);
        console.log( "sender",  data.sender_id);
        console.log( "sender",  data.message);
        console.log( "sender",  data.msgcontent);
        this.messagesTarget.innerHTML = `<strong> ${data.msgcontent} </strong>`


        notif.classList.add("notification");
        }
      }
    )
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
