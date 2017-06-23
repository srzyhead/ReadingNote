# Structure and the Cascade

## Specificity 特殊性

- For every ID attribute value given in the selector, add 0,1,0,0
- For every class attribute value, attribute selection, or pseudo-class given in the selection, add 0,0,1,0
- For every element and pseudo-element given in the selector, add 0,0,0,1
- Combinators and the universal selector do not contribute anything to the specificity
- Every inline declaration has a specificity of 1,0,0,0

```css
html > body table tr[id="totals"] td ul > li {color: maroon;}      /* 0,0,1,7 */
li#answer {color: navy;}       /* 0,1,0,1 */
div p {color: black;}       /* 0,0,0,2 */
```

## Inheritance 继承

Inheritance is the mechanism by which styles are applied not only to a specified element, but also to its descendants.
There is an exception to the upward propagation rule in HTML: background styles applied to the body element can be passed to the html element, which is the document’s root element and therefore defines its canvas.

> some properties are not inherited , most of the box-model properties including margins, padding, backgrounds, and borders

Inherited values have no specificity at all, not even zero specificity.
继承值一点特殊性都没有，甚至连0特殊性都不算。

## Cascade 层叠

cascade rules

1. Find all rules that contain a selector that matches a given element.
2. Sort by explicit weight all declarations applying to the element.
    In any case where an important and a nonimportant declaration conflict, the important declaration always wins
3. Sort by specificity all declarations applying to a given element.
4. Sort by order all declarations applying to a given element.
    The later a declaration appears in the style sheet or document, the more weight it is given.
