import { LightningElement,api } from 'lwc';
import createAccountRecord from '@salesforce/apex/AccountClassController.createdName';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class InsertingAccountRecordLWC extends LightningElement {
    @api accountName;
    @api mobileNumber;

    handleChangeAccountName(event){
        this.accountName = event.detail.value;
    }
    handleChangeMobileNumber(event){
        this.mobileNumber = event.detail.value;
    }
    createAccount(event){
        createAccountRecord({
            accountNameFromText : this.accountName,
            accountMobileNumberFromInput : this.mobileNumber
        }).then(result => {
            const event = new ShowToastEvent({
                title : 'Account Created',
                message : 'Account created successfully'+ "Account Name"+this.accountName+"Account Mobile="+ this.mobileNumber,
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