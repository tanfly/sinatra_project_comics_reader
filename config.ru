require './config/environment'

use Rack::MethodOverride
run ApplicationController
use ComicsController
use UsersController
use AuthorsController
use IllustratorsController