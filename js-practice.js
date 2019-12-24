console.log(a); //Uncaught ReferenceError: b is not defined
// ======================
console.log(b); // undefined
var b;
// ======================
var c;
console.log(c); // undefined
// ======================
let d;
console.log(d); // undefined

// ======================
console.log(c); // ReferenceError: Cannot access 'x' before initialization
let d;
// ============================================================================================================
(function(){
  var a = 1,y = 2;
  
  if(true){
    let x = a;  
    let y = y; // Cannot access 'x' before initialization
    console.log(x); //  1
    console.log(z); //  Cannot access 'x' before initialization
    let z;
  }
  console.log(z); // Cannot access 'x' before initialization
  let p;
})();
console.log(p);// Cannot access 'x' before initialization
// ============================================================================================================
var x = 1;
switch(x){
  case 0:
    let foo = 20; // SyntaxError: Identifier 'foo' has already been declared
    break;
  case 1:
    let foo = 30; // SyntaxError: Identifier 'foo' has already been declared
    break;
}
// ============================================================================================================
var x = 1;
switch(x){
  case 0:{
    let foo = 20; // SyntaxError: Identifier 'foo' has already been declared
    break;
  }
  case 1:{
    let foo = 30; // SyntaxError: Identifier 'foo' has already been declared
    break;
  }
}
// ============================================================================================================

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
 
// ============================================================================================================

#js data type 
	-> premitive: data data that is not an object and has no methods. i.e. string, number, boolean, null, undefined, symbol (new in ECMAScript 2015
	-> complex data
	
#Important Guidelines
	-> All primitive values are immutable
	-> Be aware of type coercion // coercion = action or practice of persuading someone to do something by using force or threats.
	-> There is no static typing i.e int num = 5
	-> The JavaScript engine decides what type it is	
	
# typeof infinity is number;
# typeof null is object;
# typeof undefined is undefined
# typeof NaN is number// 'number' WTF!?
# Why NaN (is not a number) a number?
	-> 
# []===[]; // false;
# true == []; // -> false
# true == ![]; // -> false
# false == []; // -> true
# false !== []; // -> true
# 5=='5' // true
# true == 'true' //false
# (5 < 6 < 7) // true because 5 < 6 becomes true and true is 1 that is smaller then 7, so it will be true
# (7 > 6 > 5) // false because 7 > 6 becomes true and true is 1 that is smaller then 5, so it will be false
# 2 + '2' // 22 because + works as operator between numbers and also works as concatenation between (number and string) and (string and string)
# 2 - '2' // 0 because - works only as number operator so it converts '2' to number.
# 2 - '5' // -3
# '2' -2 //0
# '5' - 2 // 3
# '5' - '2' // 3

#Set : The Set object lets you store unique values of any type, whether primitive values or object references. 
	var arr = [1,2,2,3,4,4,5];
	var mySet = new Set(arr); // removes duplicates from arr
	console.log(mySet); // print new set of {1, 2, 3, 4, 5} 
	console.log([...mySet]); // print new array [1, 2, 3, 4, 5]
	mySet.has(4) // true
	mySet.delete(4) // delete 4 from mySets and returns true 
	mySet.add(4) // add 4 from mySets and returns set of {1, 2, 3, 4, 5}
	mySet.clear() // clear all from set and returns undefined
	mySet.clear(4) // clear all from set and returns undefined
	
# let sayWithNormalFunction = function(){return arguments};
	console.log(sayWithNormalFunction('Hi')); // o/p:  Arguments ["hi", callee: ƒ, Symbol(Symbol.iterator): ƒ]
	
  let sayWithArrowFunction = () => {return arguments};
	console.log(sayWithArrowFunction('Hi')); // o/p:  Uncaught ReferenceError: arguments is not defined // ps: arguments don't supoort inside arrow function

  let thisInsideNormalFunction = function(){return this};  
	console.log(thisInsideNormalFunction()); // o/p: returns window object
	
  let thisInsideArrowFunction = () => {return this};  
	console.log(thisInsideArrowFunction()); // o/p: returns window object
  
  let fun = (...n)=>{return n};
	console.log(fun('Hello')); // returns ["Hello"]
	
  let fun = (...n)=>{return this};
	console.log(fun('Hello')); // returns window object but 'Hello' will be not there
	
  function Ab(a,b){this.name = a;this.age = b;return this};
	console.log(Ab('jaz',25)); // returns window object and also have name = 'jaz' and age =25;

# after return statement there should not be a line break, line break will not execute code after return
	function aa (){
		return
			'aaaa';
	}
	console.log(aa()); // will return undefined
	 
	function bb (){
		return 'bbbb';
	}
	console.log(aa()); // will return 'bbbb'

# Object.freeze() and Object.seal()
	var profile1 = {name: 'John'}
	Object.freeze(profile1); // after freeze we can't modify properties value like profile1.name = 'new name' and also can't add new properties like profile1.age = 30;
	
	var profile2 = {name: 'Max'}	
	Object.seal(profile2); // after seal we can modify properties value like profile2.name = 'new name' but we can't add new properties like profile2.age = 30;

# 	if (false) {
		console.log('This would never be executed');
	} // o/p: undefined // it will not execute
	
# Object.defineProperty() : The static method defines a new property directly on an object, or modifies an existing property on an object, and returns the object.
	// Syntax: Object.defineProperty(obj, prop, descriptor)
	let profile = {name: 'John'}
	Object.defineProperty(profile, 'age', {
		value: 20,
		writable: false
	});
	profile.name = 'new name';
	profile.age = 30; // // throws an error (TypeError: "b" is read-only) in strict mode
	console.log(profile); // {name: 'new name', age: 20} // we can not change age value 
	
# console.log(Math.max(1,2,3)); // 3
# console.log(Math.max()); // -inifinity // because Math.max() compare with lowest number (-inifinity) with inputs and here there is no input so it returns -infinity.

# console.log(Math.min(1,2,3)); // 1l
# console.log(Math.min()); // inifinity // because Math.max() compare with lowest number (-inifinity) with inputs and here there is no input so it returns -infinity.

# Accessing Form Elements:
	<form name="myForm">
		<input name="userName" type="text">
	</form>
	<script>
		var myForm = document.forms.myForm; //select form with name myForm
		var userName = myForm.userName; //get value from fields (userName) inside myForm
		myForm.userName.onfocus = function(){  // handle focus event on userName field 
			alert()
		};
	</script>
	

// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
// ============================================================================================================
