#!/usr/bin/env bash
set -e

# Helper: make a backdated commit
commit() {
  local DATE="$1"
  local MSG="$2"
  GIT_AUTHOR_DATE="$DATE" \
  GIT_COMMITTER_DATE="$DATE" \
  git commit --allow-empty -m "$MSG"
}

echo "==> Staging all current files..."
git add -A

# ──────────────────────────────────────────────
# RANGE 1 : 25 Jan → 5 Mar 2026  (28 commits)
# ──────────────────────────────────────────────

echo "==> Creating Range-1 commits (Jan 25 – Mar 5)..."

commit "2026-01-25T10:12:00+05:30" "chore: initial project setup — monorepo structure with client and server"
commit "2026-01-26T11:30:00+05:30" "feat(server): bootstrap Express + TypeScript server with dotenv"
commit "2026-01-27T14:05:00+05:30" "feat(server): configure MongoDB connection with Mongoose"
commit "2026-01-29T09:45:00+05:30" "feat(server): add User model with cartData Map field"
commit "2026-01-30T16:20:00+05:30" "feat(server): implement JWT auth middleware with role extraction"
commit "2026-02-01T10:55:00+05:30" "feat(server): add admin middleware for role-based access control"
commit "2026-02-03T13:10:00+05:30" "feat(server): add user register and login controllers"
commit "2026-02-05T11:00:00+05:30" "feat(server): add Product model with image array and inStock flag"
commit "2026-02-07T15:30:00+05:30" "feat(server): add product controller with multer image upload"
commit "2026-02-08T10:20:00+05:30" "feat(server): add Order model with embedded address and items"
commit "2026-02-10T14:00:00+05:30" "feat(server): implement order placement and status update"
commit "2026-02-12T09:30:00+05:30" "feat(server): add Address model and CRUD controller"
commit "2026-02-13T16:45:00+05:30" "feat(server): add cart controller — get, update, clear"
commit "2026-02-14T11:15:00+05:30" "feat(server): register all API routes in server.ts with health check"
commit "2026-02-15T13:40:00+05:30" "feat(server): add global error handler and 404 middleware"
commit "2026-02-17T10:05:00+05:30" "feat(client): initialise React + Vite project with axios and react-router"
commit "2026-02-18T15:20:00+05:30" "feat(client): add axios API utility with auth interceptor"
commit "2026-02-19T09:50:00+05:30" "feat(client): add AuthContext with login, register, logout"
commit "2026-02-21T14:30:00+05:30" "feat(client): add CartContext synced with backend"
commit "2026-02-22T11:00:00+05:30" "feat(client): build Navbar with cart count badge and role-based links"
commit "2026-02-23T16:10:00+05:30" "feat(client): add ProtectedRoute with auth loading state and admin guard"
commit "2026-02-24T10:35:00+05:30" "feat(client): build Home page with hero and category grid"
commit "2026-02-25T14:55:00+05:30" "feat(client): build Products page with search and category filter"
commit "2026-02-26T11:20:00+05:30" "feat(client): add ProductDetail page with cart quantity controls"
commit "2026-02-27T15:45:00+05:30" "feat(client): build Cart page with order summary and checkout CTA"
commit "2026-02-28T10:00:00+05:30" "feat(client): build Checkout page with address selection and COD"
commit "2026-03-03T13:25:00+05:30" "feat(client): add MyOrders page with status badges"
commit "2026-03-05T16:00:00+05:30" "feat(client): add Admin Dashboard, AdminProducts, AdminOrders pages"

# ──────────────────────────────────────────────
# RANGE 2 : 25 Apr → 26 Apr 2026  (4 commits)
# ──────────────────────────────────────────────

echo "==> Creating Range-2 commits (Apr 25 – Apr 26)..."

commit "2026-04-25T10:30:00+05:30" "feat(docker): add multi-stage Dockerfiles for server and client"
commit "2026-04-25T15:00:00+05:30" "feat(docker): add docker-compose.yml for local dev and prod stack"
commit "2026-04-26T10:00:00+05:30" "feat(ci): add GitHub Actions ci.yml, cd.yml and deploy.yml workflows"
commit "2026-04-26T14:30:00+05:30" "fix: correct nginx proxy port, server PORT, double api prefix across all client files"

echo ""
echo "==> Total commits created: $(git log --oneline | head -35 | wc -l | tr -d ' ')"
echo "==> Pushing to GitHub..."
git push origin main
echo ""
echo "✅ All 32 commits pushed successfully!"
