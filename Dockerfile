FROM node:20-alpine3.18 AS builder
WORKDIR /app
COPY package.json yarn.lock* ./
RUN yarn install --frozen-lockfile
COPY . .
ENV NEXT_SHARP_PATH=disabled
RUN yarn build

FROM node:20-alpine3.18 AS runner
WORKDIR /app
ENV NODE_ENV=production

COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next

EXPOSE 3000
CMD ["yarn", "start"]