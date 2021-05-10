    import { LightningElement } from 'lwc';
    import {ShowToastEvent} from 'lightning/platformShowToastEvent';
    import {NavigationMixin} from 'lightning/navigation';
    export default class CreateRecordForm extends NavigationMixin(LightningElement) {
    accountId;
    successHandler(event){
    this.accountId = event.detail.id;
    /*  this.dispatchEvent(new ShowToastEvent({
    title: 'Account Created',
    message:'Account Created Successfully',
    variant: 'success'
    })
    );*/
    console.log('test-->'+this.accountId);
    this[NavigationMixin.Navigate]({
    type: 'standard__recordPage',
    attributes : {
    recordId: this.accountId,
    objectApiName: 'Account',
    actionName: 'view',
    },
    });
    }


    }