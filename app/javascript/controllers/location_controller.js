import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ['selectedRegionId', 'selectProvinceId', 'selectCityMunicipalityId']
    fetchProvinces(){
        let target = this.selectProvinceIdTarget
        $(target).empty();
        $.ajax({
            type: 'GET',
            url: '/api/regions/' + this.selectedRegionIdTarget.value + '/provinces',
            dataType: 'json',
            success: (response) => {
                console.log(response)
                $.each(response, function (index, record) {
                    let option = document.createElement('option')
                    option.value = record.id
                    option.text = record.name
                    target.appendChild(option)
                })
            }
        })
    }

    fetchCitiesMunicipalities() {
        let target = this.selectCityMunicipalityIdTarget
        $(target).empty();
        $.ajax({
            type: 'GET',
            url: '/api/regions/' + this.selectedRegionIdTarget.value + '/provinces/' + this.selectProvinceIdTarget.value + '/cities_municipalities/',
            dataType: 'json',
            success: (response) => {
                console.log(response)
                $.each(response, function (index, record) {
                    let option = document.createElement('option')
                    option.value = record.id
                    option.text = record.name
                    target.appendChild(option)
                })
            }
        })
    }
}