declare module 'astro:content' {
	interface Render {
		'.md': Promise<{
			Content: import('astro').MarkdownInstance<{}>['Content'];
			headings: import('astro').MarkdownHeading[];
			remarkPluginFrontmatter: Record<string, any>;
		}>;
	}
}

declare module 'astro:content' {
	export { z } from 'astro/zod';

	type Flatten<T> = T extends { [K: string]: infer U } ? U : never;

	export type CollectionKey = keyof AnyEntryMap;
	export type CollectionEntry<C extends CollectionKey> = Flatten<AnyEntryMap[C]>;

	export type ContentCollectionKey = keyof ContentEntryMap;
	export type DataCollectionKey = keyof DataEntryMap;

	// This needs to be in sync with ImageMetadata
	export type ImageFunction = () => import('astro/zod').ZodObject<{
		src: import('astro/zod').ZodString;
		width: import('astro/zod').ZodNumber;
		height: import('astro/zod').ZodNumber;
		format: import('astro/zod').ZodUnion<
			[
				import('astro/zod').ZodLiteral<'png'>,
				import('astro/zod').ZodLiteral<'jpg'>,
				import('astro/zod').ZodLiteral<'jpeg'>,
				import('astro/zod').ZodLiteral<'tiff'>,
				import('astro/zod').ZodLiteral<'webp'>,
				import('astro/zod').ZodLiteral<'gif'>,
				import('astro/zod').ZodLiteral<'svg'>,
				import('astro/zod').ZodLiteral<'avif'>,
			]
		>;
	}>;

	type BaseSchemaWithoutEffects =
		| import('astro/zod').AnyZodObject
		| import('astro/zod').ZodUnion<[BaseSchemaWithoutEffects, ...BaseSchemaWithoutEffects[]]>
		| import('astro/zod').ZodDiscriminatedUnion<string, import('astro/zod').AnyZodObject[]>
		| import('astro/zod').ZodIntersection<BaseSchemaWithoutEffects, BaseSchemaWithoutEffects>;

	type BaseSchema =
		| BaseSchemaWithoutEffects
		| import('astro/zod').ZodEffects<BaseSchemaWithoutEffects>;

	export type SchemaContext = { image: ImageFunction };

	type DataCollectionConfig<S extends BaseSchema> = {
		type: 'data';
		schema?: S | ((context: SchemaContext) => S);
	};

	type ContentCollectionConfig<S extends BaseSchema> = {
		type?: 'content';
		schema?: S | ((context: SchemaContext) => S);
	};

	type CollectionConfig<S> = ContentCollectionConfig<S> | DataCollectionConfig<S>;

	export function defineCollection<S extends BaseSchema>(
		input: CollectionConfig<S>
	): CollectionConfig<S>;

	type AllValuesOf<T> = T extends any ? T[keyof T] : never;
	type ValidContentEntrySlug<C extends keyof ContentEntryMap> = AllValuesOf<
		ContentEntryMap[C]
	>['slug'];

	export function getEntryBySlug<
		C extends keyof ContentEntryMap,
		E extends ValidContentEntrySlug<C> | (string & {}),
	>(
		collection: C,
		// Note that this has to accept a regular string too, for SSR
		entrySlug: E
	): E extends ValidContentEntrySlug<C>
		? Promise<CollectionEntry<C>>
		: Promise<CollectionEntry<C> | undefined>;

	export function getDataEntryById<C extends keyof DataEntryMap, E extends keyof DataEntryMap[C]>(
		collection: C,
		entryId: E
	): Promise<CollectionEntry<C>>;

	export function getCollection<C extends keyof AnyEntryMap, E extends CollectionEntry<C>>(
		collection: C,
		filter?: (entry: CollectionEntry<C>) => entry is E
	): Promise<E[]>;
	export function getCollection<C extends keyof AnyEntryMap>(
		collection: C,
		filter?: (entry: CollectionEntry<C>) => unknown
	): Promise<CollectionEntry<C>[]>;

	export function getEntry<
		C extends keyof ContentEntryMap,
		E extends ValidContentEntrySlug<C> | (string & {}),
	>(entry: {
		collection: C;
		slug: E;
	}): E extends ValidContentEntrySlug<C>
		? Promise<CollectionEntry<C>>
		: Promise<CollectionEntry<C> | undefined>;
	export function getEntry<
		C extends keyof DataEntryMap,
		E extends keyof DataEntryMap[C] | (string & {}),
	>(entry: {
		collection: C;
		id: E;
	}): E extends keyof DataEntryMap[C]
		? Promise<DataEntryMap[C][E]>
		: Promise<CollectionEntry<C> | undefined>;
	export function getEntry<
		C extends keyof ContentEntryMap,
		E extends ValidContentEntrySlug<C> | (string & {}),
	>(
		collection: C,
		slug: E
	): E extends ValidContentEntrySlug<C>
		? Promise<CollectionEntry<C>>
		: Promise<CollectionEntry<C> | undefined>;
	export function getEntry<
		C extends keyof DataEntryMap,
		E extends keyof DataEntryMap[C] | (string & {}),
	>(
		collection: C,
		id: E
	): E extends keyof DataEntryMap[C]
		? Promise<DataEntryMap[C][E]>
		: Promise<CollectionEntry<C> | undefined>;

	/** Resolve an array of entry references from the same collection */
	export function getEntries<C extends keyof ContentEntryMap>(
		entries: {
			collection: C;
			slug: ValidContentEntrySlug<C>;
		}[]
	): Promise<CollectionEntry<C>[]>;
	export function getEntries<C extends keyof DataEntryMap>(
		entries: {
			collection: C;
			id: keyof DataEntryMap[C];
		}[]
	): Promise<CollectionEntry<C>[]>;

	export function reference<C extends keyof AnyEntryMap>(
		collection: C
	): import('astro/zod').ZodEffects<
		import('astro/zod').ZodString,
		C extends keyof ContentEntryMap
			? {
					collection: C;
					slug: ValidContentEntrySlug<C>;
			  }
			: {
					collection: C;
					id: keyof DataEntryMap[C];
			  }
	>;
	// Allow generic `string` to avoid excessive type errors in the config
	// if `dev` is not running to update as you edit.
	// Invalid collection names will be caught at build time.
	export function reference<C extends string>(
		collection: C
	): import('astro/zod').ZodEffects<import('astro/zod').ZodString, never>;

	type ReturnTypeOrOriginal<T> = T extends (...args: any[]) => infer R ? R : T;
	type InferEntrySchema<C extends keyof AnyEntryMap> = import('astro/zod').infer<
		ReturnTypeOrOriginal<Required<ContentConfig['collections'][C]>['schema']>
	>;

	type ContentEntryMap = {
		"archive": {
"2d-glasses.md": {
	id: "2d-glasses.md";
  slug: "2d-glasses";
  body: string;
  collection: "archive";
  data: InferEntrySchema<"archive">
} & { render(): Render[".md"] };
"culoare.md": {
	id: "culoare.md";
  slug: "culoare";
  body: string;
  collection: "archive";
  data: InferEntrySchema<"archive">
} & { render(): Render[".md"] };
"dracula_0-0-2alpha.md": {
	id: "dracula_0-0-2alpha.md";
  slug: "dracula_0-0-2alpha";
  body: string;
  collection: "archive";
  data: InferEntrySchema<"archive">
} & { render(): Render[".md"] };
"dracula_0-0-3alpha.md": {
	id: "dracula_0-0-3alpha.md";
  slug: "dracula_0-0-3alpha";
  body: string;
  collection: "archive";
  data: InferEntrySchema<"archive">
} & { render(): Render[".md"] };
"googlerss.md": {
	id: "googlerss.md";
  slug: "googlerss";
  body: string;
  collection: "archive";
  data: InferEntrySchema<"archive">
} & { render(): Render[".md"] };
"heroku-awk-pipes-in-colour.md": {
	id: "heroku-awk-pipes-in-colour.md";
  slug: "heroku-awk-pipes-in-colour";
  body: string;
  collection: "archive";
  data: InferEntrySchema<"archive">
} & { render(): Render[".md"] };
"mumpitz.md": {
	id: "mumpitz.md";
  slug: "mumpitz";
  body: string;
  collection: "archive";
  data: InferEntrySchema<"archive">
} & { render(): Render[".md"] };
"nodecopter_2012.md": {
	id: "nodecopter_2012.md";
  slug: "nodecopter_2012";
  body: string;
  collection: "archive";
  data: InferEntrySchema<"archive">
} & { render(): Render[".md"] };
"nodecopter_2013.md": {
	id: "nodecopter_2013.md";
  slug: "nodecopter_2013";
  body: string;
  collection: "archive";
  data: InferEntrySchema<"archive">
} & { render(): Render[".md"] };
"paradies.md": {
	id: "paradies.md";
  slug: "paradies";
  body: string;
  collection: "archive";
  data: InferEntrySchema<"archive">
} & { render(): Render[".md"] };
"raphael_js_tooltip.md": {
	id: "raphael_js_tooltip.md";
  slug: "raphael_js_tooltip";
  body: string;
  collection: "archive";
  data: InferEntrySchema<"archive">
} & { render(): Render[".md"] };
"sort_by_colour.md": {
	id: "sort_by_colour.md";
  slug: "sort_by_colour";
  body: string;
  collection: "archive";
  data: InferEntrySchema<"archive">
} & { render(): Render[".md"] };
"terminal-survival-kit.md": {
	id: "terminal-survival-kit.md";
  slug: "terminal-survival-kit";
  body: string;
  collection: "archive";
  data: InferEntrySchema<"archive">
} & { render(): Render[".md"] };
"threetomic.md": {
	id: "threetomic.md";
  slug: "threetomic";
  body: string;
  collection: "archive";
  data: InferEntrySchema<"archive">
} & { render(): Render[".md"] };
"unixblog.md": {
	id: "unixblog.md";
  slug: "unixblog";
  body: string;
  collection: "archive";
  data: InferEntrySchema<"archive">
} & { render(): Render[".md"] };
"vimify.md": {
	id: "vimify.md";
  slug: "vimify";
  body: string;
  collection: "archive";
  data: InferEntrySchema<"archive">
} & { render(): Render[".md"] };
"wunderkarte.md": {
	id: "wunderkarte.md";
  slug: "wunderkarte";
  body: string;
  collection: "archive";
  data: InferEntrySchema<"archive">
} & { render(): Render[".md"] };
};
"blog": {
"thefoodiespace.md": {
	id: "thefoodiespace.md";
  slug: "thefoodiespace";
  body: string;
  collection: "blog";
  data: InferEntrySchema<"blog">
} & { render(): Render[".md"] };
"tomatovillage-design-initial.md": {
	id: "tomatovillage-design-initial.md";
  slug: "tomatovillage-design-initial";
  body: string;
  collection: "blog";
  data: InferEntrySchema<"blog">
} & { render(): Render[".md"] };
"tomatovillage-profile.md": {
	id: "tomatovillage-profile.md";
  slug: "tomatovillage-profile";
  body: string;
  collection: "blog";
  data: InferEntrySchema<"blog">
} & { render(): Render[".md"] };
"tomatovillage.md": {
	id: "tomatovillage.md";
  slug: "tomatovillage";
  body: string;
  collection: "blog";
  data: InferEntrySchema<"blog">
} & { render(): Render[".md"] };
};

	};

	type DataEntryMap = {
		
	};

	type AnyEntryMap = ContentEntryMap & DataEntryMap;

	type ContentConfig = typeof import("../src/content/config");
}
