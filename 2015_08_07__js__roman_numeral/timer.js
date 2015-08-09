/*jslint node:true*/
'use strict';

// This is a silly test to compare speeds of my modules.
//
// I wanted to compare the difference between my original numeral generator and
// one where that generator is used to create a hash. Obviously the hash is way
// faster.
//
// Results on my computer:
//
// =======================
// Orig calculating 5 took 2
// GenHash calculating 5 took 10
// =======================
// Orig calculating 50 took 2
// GenHash calculating 50 took 8
// =======================
// Orig calculating 500 took 126
// GenHash calculating 500 took 7
// =======================
// Orig calculating 5000 took 13644
// GenHash calculating 5000 took 7
// =======================
// Orig calculating 50000 took 144631
// GenHash calculating 50000 took 8
// =======================


function timerStart(name, number) {
    var start = new Date();
    return function () {
        var stop = new Date();
        var timeTaken = stop.valueOf() - start.valueOf();
        console.log(name, 'calculating', number, 'took', timeTaken);
    };
}

[5, 50, 500, 5000, 50000].forEach(function (number) {
    console.log('=======================');
    ['Orig', 'GenHash'].forEach(function (name) {
        var timerStop = timerStart(name, number);
        var romanNumeralEncoder = require('./romanNumeralEncoder' + name);
        var n = number;
        while (n) {
            romanNumeralEncoder(n % 5000);
            n--;
        }
        timerStop();
        // clear cache
        delete require.cache[require.resolve('./romanNumeralEncoder' + name)];
    });
});
console.log('=======================');
