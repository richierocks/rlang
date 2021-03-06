% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/env.R
\name{env_lock}
\alias{env_lock}
\alias{env_is_locked}
\title{Lock an environment}
\usage{
env_lock(env)

env_is_locked(env)
}
\arguments{
\item{env}{An environment.}
}
\value{
The old value of \code{env_is_locked()} invisibly.
}
\description{
\Sexpr[results=rd, stage=render]{rlang:::lifecycle("experimental")}

Locked environments cannot be modified. An important example is
namespace environments which are locked by R when loaded in a
session. Once an environment is locked it normally cannot be
unlocked.

Note that only the environment as a container is locked, not the
individual bindings. You can't remove or add a binding but you can
still modify the values of existing bindings. See
\code{\link[=env_binding_lock]{env_binding_lock()}} for locking individual bindings.
}
\examples{
# New environments are unlocked by default:
env <- env(a = 1)
env_is_locked(env)

# Use env_lock() to lock them:
env_lock(env)
env_is_locked(env)

# Now that `env` is locked, it is no longer possible to remove or
# add bindings. If run, the following would fail:
# env_unbind(env, "a")
# env_bind(env, b = 2)

# Note that even though the environment as a container is locked,
# the individual bindings are still unlocked and can be modified:
env$a <- 10
}
\seealso{
\code{\link[=env_binding_lock]{env_binding_lock()}}
}
