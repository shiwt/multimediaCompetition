var intro = document.getElementById('introduction'),
	cause = document.getElementById('cause'),
	symptoms = document.getElementById('symptoms'),
	checkway = document.getElementById('checkway'),
	intro_div = document.getElementById('introduction_div'),
	cause_div = document.getElementById('cause_div'),
	symptoms_div = document.getElementById('symptoms_div'),
	checkway_div = document.getElementById('checkway_div');


function introduction() {
	intro.style.backgroundColor = '#09f';
	cause.style.backgroundColor = '#e6e6e6';
	symptoms.style.backgroundColor = '#e6e6e6';
	checkway.style.backgroundColor = '#e6e6e6';
	intro_div.style.display = 'block';
	cause_div.style.display = 'none';
	symptoms_div.style.display = 'none';
	checkway_div.style.display = 'none';
}

function cause(){
	intro.style.backgroundColor = '#e6e6e6';
	cause.style.backgroundColor = '#09f';
	symptoms.style.backgroundColor = '#e6e6e6';
	checkway.style.backgroundColor = '#e6e6e6';
	intro_div.style.display = 'none';
	cause_div.style.display = 'block';
	symptoms_div.style.display = 'none';
	checkway_div.style.display = 'none';
}
function symptoms(){
	intro.style.backgroundColor = '#e6e6e6';
	cause.style.backgroundColor = '#e6e6e6';
	symptoms.style.backgroundColor = '#09f';
	checkway.style.backgroundColor = '#e6e6e6';
	intro_div.style.display = 'none';
	cause_div.style.display = 'none';
	symptoms_div.style.display = 'block';
	checkway_div.style.display = 'none';
}
function checkway(){
	intro.style.backgroundColor = '#e6e6e6';
	cause.style.backgroundColor = '#e6e6e6';
	symptoms.style.backgroundColor = '#e6e6e6';
	checkway.style.backgroundColor = '#09f';
	intro_div.style.display = 'none';
	cause_div.style.display = 'none';
	symptoms_div.style.display = 'none';
	checkway_div.style.display = 'block';
}