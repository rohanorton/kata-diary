/*jslint node:true*/
/*globals describe, it*/

'use strict';

var romanNumeralEncoder = require('./romanNumeralEncoderOrig.js');
var assert = require('assert');

var numbers = [
    {number: 1, numeral: 'I'}, {number: 2, numeral: 'II'}, {number: 3, numeral: 'III'}, {number: 4, numeral: 'IV'}, {number: 5, numeral: 'V'},
    {number: 6, numeral: 'VI'}, {number: 7, numeral: 'VII'}, {number: 8, numeral: 'VIII'}, {number: 9, numeral: 'IX'}, {number: 10, numeral: 'X'},
    {number: 11, numeral: 'XI'}, {number: 12, numeral: 'XII'}, {number: 13, numeral: 'XIII'}, {number: 14, numeral: 'XIV'}, {number: 15, numeral: 'XV'},
    {number: 16, numeral: 'XVI'}, {number: 20, numeral: 'XX'}, {number: 30, numeral: 'XXX'}, {number: 40, numeral: 'XL'}, {number: 41, numeral: 'XLI'},
    {number: 50, numeral: 'L'}, {number: 90, numeral: 'XC' }, {number: 100, numeral: 'C'}, {number: 101, numeral: 'CI'}, {number: 212, numeral: 'CCXII'},
    {number: 353, numeral: 'CCCLIII'}, {number: 404, numeral: 'CDIV'}, {number: 555, numeral: 'DLV'}, {number: 846, numeral: 'DCCCXLVI'}, {number: 927, numeral: 'CMXXVII'},
    {number: 1008, numeral: 'MVIII'}, {number: 1999, numeral: 'MCMXCIX'}, {number: 2420, numeral: 'MMCDXX'}, {number: 3000, numeral: 'MMM'}
    ];

describe('roman numeral encoder', function () {
    numbers.forEach(function (n) {
        it('should take a number ' +  n.number + ' and output ' + n.numeral, function () {
            assert.equal(romanNumeralEncoder(n.number), n.numeral);
        });
    });
});


