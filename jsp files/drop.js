/**
 * 
 */
var config = {
    cUrl: 'https://api.countrystatecity.in/v1/countries',
    ckey: 'NHhvOEcyWk50N2Vna3VFTE00bFp3MjFKR0ZEOUhkZlg4RTk1MlJlaA=='
}

var countrySelect = document.querySelector('.country'),
    stateSelect = document.querySelector('.state'),
    citySelect = document.querySelector('.city')

var selectedCountryCode = null; // Add this variable to store the selected country code
var selectedStateCode = null;
function loadCountries() {
    let apiEndPoint = config.cUrl

    fetch(apiEndPoint, { headers: { "X-CSCAPI-KEY": config.ckey } })
        .then((response) => response.json())
        .then((data) => {
            console.log(data);

            data.forEach((country) => {
                const option = document.createElement('option');
                option.value = country.name; // Set the country name as the value
                option.textContent = country.name; // Display the country name

                // Store the country code (iso2) in a data attribute
                option.dataset.countryCode = country.iso2;

                countrySelect.appendChild(option);
            });
        })
        .catch((error) => console.error('Error loading countries:', error));

    stateSelect.disabled = true;
    citySelect.disabled = true;
    stateSelect.style.pointerEvents = 'none';
    citySelect.style.pointerEvents = 'none';
}

function loadStates() {
    stateSelect.disabled = false;
    citySelect.disabled = true;
    stateSelect.style.pointerEvents = 'auto';
    citySelect.style.pointerEvents = 'none';

    selectedCountryCode = countrySelect.options[countrySelect.selectedIndex].dataset.countryCode; // Store the selected country code
    stateSelect.innerHTML = '<option value="">Select State</option>'; // for clearing the existing states
    citySelect.innerHTML = '<option value="">Select City</option>'; // Clear existing city options

    fetch(`${config.cUrl}/${selectedCountryCode}/states`, { headers: { "X-CSCAPI-KEY": config.ckey } })
        .then((response) => response.json())
        .then((data) => {
            console.log(data);

            data.forEach((state) => {
                const option = document.createElement('option');
                option.value = state.name; // Set the state name as the value
                option.textContent = state.name; // Display the state name
                 option.dataset.stateCode = state.iso2;
                stateSelect.appendChild(option);
            });
        })
        .catch((error) => console.error('Error loading states:', error));
}

function loadCities() {
    citySelect.disabled = false
    citySelect.style.pointerEvents = 'auto'

       selectedCountryCode = countrySelect.options[countrySelect.selectedIndex].dataset.countryCode; // Store the selected country code
       selectedStateCode = stateSelect.options[stateSelect.selectedIndex].dataset.stateCode; // Store the selected country code

    // console.log(selectedCountryCode, selectedStateCode);

    citySelect.innerHTML = '<option value="">Select City</option>' // Clear existing city options

    fetch(`${config.cUrl}/${selectedCountryCode}/states/${selectedStateCode}/cities`, {headers: {"X-CSCAPI-KEY": config.ckey}})
    .then(response => response.json())
    .then(data => {
        // console.log(data);

        data.forEach(city => {
            const option = document.createElement('option')
            option.value = city.name
            option.textContent = city.name 
            citySelect.appendChild(option)
        })
    })
}
window.onload = loadCountries;
