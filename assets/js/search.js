import './jquery.instantSearch.js';

$(function() {
    $('.search-field').instantSearch();

    let searchParams = new URLSearchParams(window.location.search);
    if(searchParams.has('q')){
        let q = searchParams.get('q');
        $('.search-field').val(q).keyup();
    }
});
