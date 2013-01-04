
-record(service, { id, desc, contacts, key, perms, state, velocity }).
-record(user, { id, credentials, services, state, velocity }).
-record(admin, { id, desc, contacts, key, can_admin_admin, state, velocity }).
-record(credential, { pwd1, pwd2, captcha }).
-record(captcha, { id, code, pic, etime }.

-record(state, { is_suspended, ctime, mtime, dirty }).
-record(velocity, { current, limit }).

generate_captcha(Service, Signature) -> {ok, Captcha}.
authenticate_user(Service, User, Signature) -> {ok, User}.
register_user(Service, User, Signature) -> {ok, User}.
reset_user_crendetials(Service, User, Signature) -> {ok, User}.

suspend_user(Admin, User, Signature) -> {ok, User}.
reinstate_user(Admin, User, Signature) -> {ok, User}.
    
register_admin(Admin0, Admin1, Signature) -> {ok, Admin}.
suspend_admin(Admin0, Admin1, Signature) -> {ok, Admin}.
reinstate_admin(Admin0, Admin1, Signature) -> {ok, Admin}.

register_service(Admin, Service, Signature) -> {ok, Service}.
suspend_service(Admin, Service, Signature) -> {ok, Service}.
reinstate_service(Admin, Service, Signature) -> {ok, Service}.
    
set_default_service_velocity(Admin, Type, Velocity, Signature) -> {ok, Velocity}.


