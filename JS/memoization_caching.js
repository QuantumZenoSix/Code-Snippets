function memoize(todo){

	const cache = {}

	return function memoizedResult(val){
  
  	 if( cache[val] ){
     		console.log("Using cached result 🙂")
        return cache[val]
      }
  
  
  	cache[val] = todo(val)
  
  	return cache[val]
  }

}

function multiplyByThree(value){
  console.log("Calculating...")
  return value * 3;
}

const memoizedMultiplyThree = memoize(multiplyByThree)

const result = memoizedMultiplyThree(2)
console.log( result)

const result2 = memoizedMultiplyThree(2)
console.log( result2)

const result3 = memoizedMultiplyThree(3)
console.log( result3)
