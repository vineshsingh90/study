console.log(a); //Uncaught ReferenceError: b is not defined
// ======================
var a;
console.log(a); // undefined
// ======================
5+true=6;
5-true=4;
5+false=5;
5-false=5;
5+false+true=6;
5-false+true=6;
"aa"+true="aatrue";
"aa"-true=NaN;
string-string=NaN;
"5"-2=3;
"a"-2=NaN;
true+"aa"="trueaa";
11-"5"-2=4;
11+"5"-2=113;
"a"+11-"5"-2=NaN;
null+false=0;
null-false=0;
null-true=-1;
null-0=0;
null+0=0;
null+number=number;
null-number=-number;
null + "aaa"='nullaaa';
undefined + Number || Boolean  = NaN;
undefined-1=Nan
undefined + "aaa"='undefinedaaa';

// ======================
console.log("first");
setTimeout(() => {
    console.log("second");
}, 0);
console.log("third");
// first
// third
// second

// ======================
console.log("first");
setTimeout(() => {
    console.log(a);
}, 0);
var a = "second";
console.log("third");
// first
// third
// second

// ======================
console.log("first");
setTimeout(() => {
    console.log(a);
}, 0);
var a = "second";
console.log(b);
var b = ("third");
// first
// undefined
// second

// ======================

// == v/s ===
5=="5" & 1==true & 0==false & '1'==true & '0'==false & null==undefined & 0 == -0 & 0 === -0  //true
JSON.stringify([])==JSON.stringify([]) & JSON.stringify({})==JSON.stringify({}) // true

5==="5" & 1===true & 0===false & null === undefined & null==0 & undefined==0 & NaN==NaN & NaN===NaN//false
[]==[] & []===[] & {}=={} & {}==={} & [0,1]==[0,1] & {'name':'vs'}=={'name':'vs'}  // false

// ======================
const arr = ['a', 'b', 'c'];
arr.test = 'abc';
console.log(arr); // ["a", "b", "c"]
console.log(arr.test); // "abc"
    
// ======================
// ======================
// ======================
// ======================
// ======================
// ======================
// ======================
// ======================
// ======================
// ======================
// ======================
// ======================
// ======================
// ======================
// ======================
// ======================
// ======================
// ======================
// ======================
