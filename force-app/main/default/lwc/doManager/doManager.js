import { LightningElement,track } from 'lwc';

export default class DoManager extends LightningElement {
 time='8:56';
 greeting='Good Morning';
 @track todos = [];

connectedCallback(){
   this.getTime();
   setInterval( ()=>{
       this.getTime();
   }, 1000 );
}

        getTime(){
        const date = new Date();
        const hour = date.getHours();
        const min = date.getMinutes();
        this.time = `${this.getHours(hour)}: ${this.getMinutes(min)} ${this.getMidday(hour)}`;
        this.greeting = `${this.setGreeting(hour)}`;
        }
        getHours(hour){
        return hour === 0 ? 12 : hour > 12 ? hour - 12 : hour;
        }
        getMinutes(min){
        return min < 10 ? "0"+min :min;
        }
        getMidday(hour)
        {
        return hour >= 12 ? "PM":"AM";
        }
        setGreeting(hour){
            if(hour < 12)
            {
                return "Good Morning";
            }
            else
            if(hour >=12 && hour <=17)
            {
                return "Good Afternoon";
            }
            else
            if(hour > 17)
            {
               return "Good Night";
            }
        }

        toDoHandler(){
            const inputBox = this.template.querySelector("lightning-input");
            console.log('input values--',inputBox.value);
            const todo ={
                todoId: this.todos.length,
                todoName: inputBox.value,
                done:false,
                todoDate: new Date()
            }
            this.todos.push(todo);
            inputBox.value = '';
        }

       get upcomingTask(){
            return this.todos && this.todos.length ? this.todos.filter(todo => !todo.done) : [];
        }
       get completedTask(){
            return this.todos && this.todos.length ? this.todos.filter(todo => todo.done) : [];
        }
        
     
}