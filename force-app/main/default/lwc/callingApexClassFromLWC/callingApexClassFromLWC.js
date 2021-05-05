import { LightningElement,api,wire,track } from 'lwc';
import getFirstLastEmailFetch from '@salesforce/apex/StudentFirstLastEmailFetch.getFirstLastEmailFetch';
 // import standard toast event
 import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class CallingApexClassFromLWC extends LightningElement {
@api first_Name;
@api last_Name;
@api email;

handle_First_Name_Change(event){
    this.first_Name = event.detail.value;
}
handle_Last_Name_Change(event){
    this.last_Name = event.detail.value;
}
handle_Email_Change(event){
    this.email = event.detail.value;
}
handle_Submit(event){
    getFirstLastEmailFetch({
        FirstName : this.first_Name,
        LastName : this.last_Name,
        Email : this.email
    }).then(result => {
        const event = new ShowToastEvent({
            title: 'Student created',
            message: 'New Student'+ this.first_Name + ' '+ this.last_Name+' created.',
            variant:'success'
        });
        this.dispatchEvent(event);
    }).catch(error => {
        const event = new ShowToastEvent({
title : 'Error',
message: 'Please contact system admin',
variant:'error'
        });
        this.dispatchEvent(event);
    })
}
}