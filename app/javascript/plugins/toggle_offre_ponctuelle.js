const toggleOffrePonctuelle = () => {
  const inputOffre = document.getElementById('offre_ponctuelle');
  const discountPrice = document.querySelector('.lesson_lesson_discount_price');

  inputOffre.addEventListener('click', (e) => {
    if(discountPrice.style.display === 'block') {
      discountPrice.style.display = 'none';
    }
    else {
      discountPrice.style.display = 'block';
    }
  })
}

export { toggleOffrePonctuelle };

