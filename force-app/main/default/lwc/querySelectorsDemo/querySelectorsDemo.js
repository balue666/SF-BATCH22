import { LightningElement } from 'lwc';

export default class QuerySelectorsDemo extends LightningElement {
    fruits = ["Apple", "Banana", "Orange", "Mango"];

    clickHandler(){
        //querySelector demo
        const pelem = this.template.querySelector('p');
        console.log(pelem.innerText);
        pelem.style.backgroundColor = 'aliceblue';
        pelem.style.fontSize = '16px';
        pelem.style.fontWeight = 'bold';

        //querySelectorAll demo
        const divElems = this.template.querySelectorAll('div.child');
        divElems.forEach(item => {
            console.log(item.innerText);
            item.style.backgroundColor = 'yellow';
            item.style.border = '2px solid green';
            item.style.fontSize = '16px';
            item.style.margin = '2px';
            item.setAttribute('class', 'slds-align_absolute-center');
            item.setAttribute('title', item.innerText);
        })
    }
}