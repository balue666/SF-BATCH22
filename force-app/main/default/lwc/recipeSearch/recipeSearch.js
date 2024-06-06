import { LightningElement, wire } from 'lwc';
import getCusineTypes from '@salesforce/apex/RecipeCtrl.getCusineTypes';
import getRecipes from '@salesforce/apex/RecipeCtrl.getRecipes';

export default class RecipeSearch extends LightningElement {
    cuisineOptions = []; //to store cuisine type options
    recipes; //to store search results
    info = "Select a cuisine type!";

    @wire(getCusineTypes)
    cuisineHandler({data, error}){
        if(data){
            this.cuisineOptions = this.generatePicklistValues(data);
        }
        if(error){
            console.error(error);
        }
    }

    //Converts of list of strings into list objects. each object contains label, value properties
    generatePicklistValues(data){
        return data.map(item => ({
            label: item,
            value: item
        }));
    }

    changeHandler(event){
        const selectedCuisine = event.target.value;
        getRecipes({cuisineType: selectedCuisine})
        .then(result => {
            this.recipes = result;
            this.info = undefined;
        })
        .catch(error => {
            this.info = error;
            this.recipes = undefined;
        })
    }
}