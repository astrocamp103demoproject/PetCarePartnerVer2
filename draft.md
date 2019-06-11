User
\$rails g model User name email password address pet_count avatar pic

Sitter
\$rails g model Sitter name email password address avatar pic square_meters:integer pet_limit:integer slogan:text price:integer

Booking_date
\$rails g model Booking_date sitter:references order:references date:datetime available:boolean

Oder
\$rails g model Order user:references drop_off:datetime pick_up:datetime note:text status checkout_time:datetime

Payment
\$rails g model Payment order:references status

Pet
\$rails g model Pet size:integer user:references
