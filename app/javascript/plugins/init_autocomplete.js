import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('eleve_company_address');
  if (addressInput) {
    places({ container: addressInput });
  }

  const cityInput = document.getElementById('eleve_city');
  if (cityInput) {
    places({ container: cityInput });
  }
};

export { initAutocomplete };
