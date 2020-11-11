module QuickSearch
  class HistorySearcher < QuickSearch::Searcher
   
    def search
      @http.ssl_config.verify_mode=(OpenSSL::SSL::VERIFY_NONE)
      resp = @http.get(base_url, parameters.to_query)
      @response = JSON.parse(resp.body)
    end

    def results
      if results_list
        results_list

      else
        @results_list = []

        #@match_fields = ['title_ssm', '']

        @response['data'].each do |value|
          result = OpenStruct.new
          result.title = value['title']['attributes']['value']
          result.link = link_builder(value)
          if value.key?('display_date')
            result.date = value['display_date']['attributes']['value']
          end
          #if value.key?('description')
            #result.author = value['description'][0]
          #end
          if value.key?('file')
            result.thumbnail = URI::join(value['file']['attributes']['value'], "?file=thumbnail").to_s
          end
          #if value.key?('collection_tesim')
            #result.collection = [value['collection_tesim'][0], collection_builder(value['collection_number_tesim'][0]).to_s]
          #end
          if value.key?('description')
            result.description = value['description']['attributes']['value']
          end

          @results_list << result
        end

        @results_list
      end

    end

    def base_url
      "https://archives.albany.edu/history"
    end

    def parameters
      {
        'search_field' => 'all_fields',
        'q' => http_request_queries['not_escaped'],
        'utf8' => true,
        'per_page' => @per_page,
        'format' => 'json'
      }
    end

    def link_builder(value)
      link = URI::join(base_url, +"/concern/" + value['has_model_ssim'][0].downcase + "s/" + value['id']).to_s

      link
    end

    def collection_builder(uri)
      collection_link = URI::join("https://archives.albany.edu/history" + uri.tr(".", "-"))

      collection_link
    end

    def total
      @response['response']['pages']['total_count'].to_i
    end

    def loaded_link
      "https://archives.albany.edu/history?search_field=all_fields&q=" + http_request_queries['not_escaped']
    end

  end
end
