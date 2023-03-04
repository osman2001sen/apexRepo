import { LightningElement } from 'lwc';

export default class HelloLWCcomp extends LightningElement {

    sampleText='Hello LWC Component!'           //Property

    employee={                                  //Object
        Name:'Osman',
        Age:'35Y',
        City:'Toronto',
        Salary:100000
    }

    employeeList=[

        {
            Code:'001',
            Name:'John',
            Age:'35Y',
            City:'Toronto',
            Salary:35000
        },
        {
            Code:'002',
            Name:'Joseph',
            Age:'33Y',
            City:'Montreal',
            Salary:50000
        },
        {
            Code:'003',
            Name:'Oliver',
            Age:'30Y',
            City:'Ottawa',
            Salary:100000
        }
    ]

    get getEmployeeCode(){                      //Get method
        const band = this.employee.Salary<=30000 ? 'B1' : this.employee.Salary<=60000 ? 'B2' : 'B3';
        return band;
    }

}