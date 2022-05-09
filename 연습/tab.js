$('.list').click(function(){
    for(let i = 0; i < $('.tab-button').length; i++){
    $('.tab-button').eq(i).on('click', function(){
        탭열기(i);
            });
        };
    });
// if(e.target == document.querySelectorAll('.tab-button')[0]){
//     탭열기(0);
// }

function 탭열기(){
    $('.tab-button').removeClass('orange');
    $('.tab-button').eq(0).addClass('orange');
    $('.tab-content').removeClass('show');
    $('.tab-content').eq(0).addClass('show');
};
