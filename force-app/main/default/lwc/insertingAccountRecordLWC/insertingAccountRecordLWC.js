import { LightningElement,api } from 'lwc';
import createAccountRecord from '@salesforce/apex/AccountClassController.createdName';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class InsertingAccountRecordLWC extends LightningElement {
    @api accountName;

    handleChangeAccountName(event){
        this.accountName = event.detail.value;
    }
    createAccount(event){
        createAccountRecord({
            accountNameFromText : this.accountName
        }).then(result => {
            const event = new ShowToastEvent({
                title : 'Account Created',
                message : 'Account created successfully'+ this.accountName,
                variant : 'success'
            });
            this.dispatchEvent(event);
        }).catch(error => {
            const event= new ShowToastEvent({
                title: 'Error',
                message : 'Please contact to admin',
                variant : 'error'
            });
            this.dispatchEvent(event);
        })

    }
}