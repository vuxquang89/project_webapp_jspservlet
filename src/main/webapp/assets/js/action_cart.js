var fadeTime = 300;
$( document ).ready(function() { 
	$(".cti-product-size input").focus(function () {
        $(this).closest(".cti-product-size").find("ul").show();
        $(this).closest(".cti-product-size").find("ul li").show();
    });

    $(".cti-product-size input").blur(function () {
        let that = this;
        setTimeout(function () {
            $(that).closest(".cti-product-size").find("ul").hide();
        }, 300);
    });

    $(document).on('click', '.cti-product-size ul li', function () {
        $(this).closest(".cti-product-size").find("input").val($(this).text()).blur();
        //update quantity
        var id = $(this).closest(".cti-product-size").data('id');
       
        updateQuantity(id, $(this).text());
    });

    $('input[name=amount]').change(function(){
    	var id = $(this).parent(".cti-product-size").data('id');
        
    	updateQuantity(id, $(this).val());
    });
    
    $('.cti-delete input').click(function(){
    	var id = $(this).closest('.cti-delete').data('id');
    	deleteItem(id, this);
    	
    });
});

function deleteItem(id, removeButton){
	$.ajax({
		url : 'addToCart',
		method : 'post',
		data : {action:'delete', id:id},
		success : function(result){
			//console.log(result);
			removeItem(removeButton);
		},
		error : function(jqXHR, exception){
			alert("Đã có lỗi! Không thể xóa sản phẩm!")
			console.log('Delete Error occured');
		}
	});
}

/* Remove item from cart */
function removeItem(removeButton)
{
  /* Remove row from DOM and recalc cart total */
	var productRow = $(removeButton).closest('.cti-product-brand').closest('.cti-item');
	productRow.slideUp(fadeTime, function() {
		//console.log("remove item");
	    productRow.remove();
	    recalculateCart();
	});
}

function updateQuantity(id, quantity){
	$.ajax({
		url : 'addToCart',
		method : 'post',
		data : {action:'update', id:id, quantity:quantity},
		success : function(result){
			//console.log(result);
			recalculateCart();
		},
		error : function(jqXHR, exception){
			alert("Đã có lỗi! Không thể cập nhật số lượng trong giỏ!");
			console.log('Update Error occured');
		}
	});
}

/* cập nhật lại giỏ hảng */
function recalculateCart(){
	var sumQuantity = 0;
	var sumPrice = 0;
	/*tính tổng số lượng*/
	$(".cti-product-properties").each(function(){
		
		var numQ = parseInt($(this).children(".cti-product-size").find(".change-amount").val());
		var numP = String($(this).children(".cti-product-price").find("strong").text().match(/[0-9.,]+/g));
		numP = numP.split(",").join("");
		
		sumQuantity +=  numQ;
		sumPrice += (parseFloat(numP) * numQ);
		
	});
	
	//cập nhật giá và số lượng
	$("#cart-info-quantity").html(sumQuantity);
	$("#cart-amount").html(sumQuantity);
	$("#cart-price").html(showNumber(sumPrice+"")+"đ");
}

function showNumber(a){
	const n = 3;
    var l ="", m ="", p = ",";
	for(var i = a.length; i > 0; i-=3){
        if(i<=n){
			m = a.substr(0,i);
            p = "";
        }else{
    		m = a.substr(i-n,n);
        }
        l = p + m + l;        
    }
    return l;
}