/*
$(document).ready(function () {
    var size_li = $("#listSearch li").length;
    var limit=1;
    $('#listSearch li:lt('+limit+')').show();
    
    $('#viewMore').click(function () {
        limit= (limit+5 <= size_li) ? limit+5 : size_li;
        $('#listSearch li:lt('+limit+')').show();
    });
    
    $('#showLess').click(function () {
        x=(x-5<0) ? 3 : x-5;
        $('#myList li').not(':lt('+x+')').hide();
    });
});
*/
/*
const loadmore = document.querySelector('#viewMore');
let currentItems = 2;
loadmore.addEventListener('click', (e) => {
	const elementList = [...document.querySelectorAll('.list .list-element')];
    for (let i = currentItems; i < currentItems + 2; i++) {
    	if (elementList[i]) {
    		elementList[i].style.display = 'block';
        }
    }
    currentItems += 2;

    // Load more button will be hidden after list fully loaded
    if (currentItems >= elementList.length) {
    	event.target.style.display = 'none';
    }
});
*/
document.addEventListener("DOMContentLoaded", function(event) {
     loadMore();
});
let currentItem = 0;
let current = 6;
function loadMore(){
	
	const ul = document.querySelectorAll('#listSearch .item');
	
	const btn = document.getElementById("viewmore");
	for (let i = currentItem; i < currentItem + current; i++) {
    	if (ul[i]) {
    		
    		ul[i].style.display = 'block';
        }
    }
    currentItem += current;
    var i = (currentItem < ul.length) ? ul.length - currentItem : 0;
    btn.innerHTML = "Còn "+i+" sản phẩm";
    var span = document.createElement("SPAN");
    btn.appendChild(span);
    // an button show khi hien thi het
    
    if (currentItem >= ul.length) {
    	btn.style.display = 'none';
    }
}