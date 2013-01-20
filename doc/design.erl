

-record(service, { id, desc, contacts, key, perms, state, velocity }).
-record(user, { id, credentials, services, state, velocity }).
-record(admin, { id, desc, contacts, key, perms, state, velocity }).
-record(credential, { pwd1, pwd2, captcha }).
-record(captcha, { id, code, pic, etime }.

-record(service_perms, { authenticate_user, register_user, reset_user_credentials }).
-record(admin_perms, { suspend_user, reinstate_user, register_admin, suspend_admin, reinstate_admin, register_service, suspend_service, reinstate_service }).
-record(state, { is_suspended, creator, ctime, mtime, dirty }).
-record(velocity, { current, limit }).

generate_captcha(Service, Signature) -> {ok, Captcha}.
authenticate_user(Service, User, Signature) -> {ok, User}.
register_user(Service, User, Signature) -> {ok, User}.
reset_user_credentials(Service, User, Signature) -> {ok, User}.

suspend_user(Admin, User, Signature) -> {ok, User}.
reinstate_user(Admin, User, Signature) -> {ok, User}.
    
register_admin(Admin0, Admin1, Signature) ->
    register_admin(check_param_sanity, Admin0, Admin1, Signature, check_param_sanity(register_admin, Admin0, Admin1)).
register_admin(check_param_sanity, _, _, _, {nok, Error}) -> {nok, Error};
register_admin(check_param_sanity, Admin0, Admin1, Signature, true) ->
    register_admin(verfiy_signature, Admin0, Admin1, verify_signature(register_admin, Admin0, Admin1, Signature)).
register_admin(verify_signature, _, _, false) -> {nok, bad_signature};
register_admin(verify_signature, Admin0, Admin1, true) -> 
    register_admin(check_admin0_perms, Admin0, Admin1, check_admin_perms(register_admin, Admin0).
register_admin(check_admin0_perms, _, _, false) -> {nok, no_permission};
register_admin(check_admin0_perms, Admin0, Admin1, true) ->
    register_admin(check_dup_admin, Admin0, Admin1, if_admin_exist(Admin1)).
register_admin(check_dup_admin, _, _, true) -> {nok, admin_exists};
register_admin(check_dup_admin, Admin0, Admin1, false) ->
    create_admin(Admin1),
    update_admin_
	
#admin{id=Admin0_id, perms=Admin0_perms} = Admin0,
    #admin{id=Admin1_id, desc=Admin1_desc, contacts=Admin1_contacts, key=Admin1_key, perms=Admin1_perms} = Admin1,
    register_admin(Signature =:= sign([Admin0_id, Admin01_id, Admin1_desc, Admin1_contacs
    {ok, Admin}.
suspend_admin(Admin0, Admin1, Signature) -> {ok, Admin}.
reinstate_admin(Admin0, Admin1, Signature) -> {ok, Admin}.

register_service(Admin, Service, Signature) -> {ok, Service}.
suspend_service(Admin, Service, Signature) -> {ok, Service}.
reinstate_service(Admin, Service, Signature) -> {ok, Service}.
    
set_default_service_velocity(Admin, Type, Velocity, Signature) -> {ok, Velocity}.

