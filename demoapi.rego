package http.authz

default allow = false

allow {
	input.method == "GET"
	input.path == ["api", "v1", "products"]
	contains(scope_claim, "api.identicum.com/product:read")
}

allow {
	input.method == "POST"
	input.path == ["api", "v1", "products"]
	contains(scope_claim, "api.identicum.com/product:write")
}

scope_claim := claims.scope {
	auth_header := input.headers.authorization
	startswith(auth_header, "Bearer ")
	bearer_token := substring(auth_header, count("Bearer "), -1)

	# Verify the signature on the Bearer token.
	# io.jwt.verify_hs256(bearer_token, "B41BD5F462719C6D6118E673A2389")

	# The `io.jwt.decode` function returns an array: [header, payload, signature]
	[_, claims, _] := io.jwt.decode(bearer_token)
}