public with sharing class CalculatorCallout {
    //get calculated outcomes via callout
    public static Double getSum(Double num1, Double num2){
        CalculatorServices.CalculatorImplPort service = new CalculatorServices.CalculatorImplPort(); //Outer Class.Inner Class
        Double sum = service.doAdd(num1, num2);
        System.debug('Sum: ' + sum);
        return sum;
    }

    public static Double getProduct(Double num1, Double num2){
        CalculatorServices.CalculatorImplPort service = new CalculatorServices.CalculatorImplPort(); //Outer Class.Inner Class
        Double product = service.doMultiply(num1, num2);
        System.debug('Product: ' + product);
        return product;
    }
}