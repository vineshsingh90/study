
**1. Find the longest word length in a message**
```js
    var msg1 = "The quick borwn fox jumped over lazy dog";
    var msg2 = "Otorhinolaryngology long word in this message";
    
    // basic level ---------------------------
    function findLongestWordLength_basic(msg){
        var words = msg.split(" ");
        var maxLength = 0;
        for(var i=0; i<words.length; i++){
          if(words[i].length > maxLength){
            maxLength = words[i].length;
          }  
        }
        return maxLength;
    }
  console.log(findLongestWordLength_basic(msg1)); // o/p: 6
  console.log(findLongestWordLength_basic(msg2)); // o/p: 19
   
  // intermediate level ---------------------------
  function findLongestWordLength_intermediate(msg){
    return msg.split(' ').reduce(function(x, y){
       return Math.max(x, y.length)
    }, 0)
  }
  console.log(findLongestWordLength_intermediate(msg1)); // o/p: 6
  console.log(findLongestWordLength_intermediate(msg2)); // o/p: 19
  
  // advanced/complex level (slow execution) ---------------------------
  function findLongestWordLength_advanced(msg){
    var words = msg.split(' ');
    if(words.length == 1){
        return  words[0].length;
    }
    if(words[0].length >= words[1].length){
        words.splice(1,1);
        return findLongestWordLength_advanced(words.join(' '));
    }
    if(words[0].length <= words[1].length){
        
        return findLongestWordLength_advanced(words.slice(1, words.length).join(' '));
    }
  }
  console.log(findLongestWordLength_advanced(msg1)); // o/p: 6
  console.log(findLongestWordLength_advanced(msg2)); // o/p: 19
```

**2. Reverse a string**
```js
    var msg = 'I love my India';
    // solution 1
    function reverseString_1(str){
        str = str.split('');
        str = str.reverse();
        str = str.join('');
        return str;
    }
    console.log(reverseString_1(msg)); // o/p: "aidnI ym evol I"
    
    // solution 2
    function reverseString_2(str){
        return str.split('').reverse().join('');       
    }
    console.log(reverseString_2(msg)); // o/p: "aidnI ym evol I"
    
    // solution 3
    function reverseString_3(str){
        str.split('');
        var newStr = '';
        for(var i=str.length-1; i>=0; i--){
            newStr += str[i];
        }
        return newStr;
    }
    console.log(reverseString_3(msg)); // o/p: "aidnI ym evol I"
    
    // solution 4
    function reverseString_4(str){
     var newStr = '';
        for(var i=str.length-1; i>=0; i--){
            newStr += str[i];
        }
        return newStr;
    }
    console.log(reverseString_4(msg)); // o/p: "aidnI ym evol I"
    
```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

****
```js

```

