import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {NavigationMixin} from 'lightning/navigation';
export default class CreateRecordForm extends NavigationMixin(LightningElement) {
    accountId;
    successHandler(event){
        this.accountId = event.detail.id;
      this.dispatchEvent(new ShowToastEvent({
           title: 'Account Created',
           message:'Account Created Successfully',
           variant: 'success'
       })
      );
    }

    recordPageUrl;
    connectedCallback(){
this[NavigationMixin.GenerateUrl]({
    type: 'standard_recordPage',
    attribute : {
        recordId: this.accountId,
        actionName: 'view',
    },
}).then(url => {
this.recordPageUrl= url;
});
    }
}