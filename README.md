# Spine.Mobile-Rails

Use spine.mobile from the rails asset pipeline

## Usage

     rails g spine:mobile:new

Use the `mobile` layout in your controller

     class SiteController < ApplicationController
       layout 'mobile'
       
       def index
       end
     end
