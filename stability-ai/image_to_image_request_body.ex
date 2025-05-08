defmodule ImageToImageRequestBody do
  @moduledoc """
  Provides struct and type for a ImageToImageRequestBody
  """

  @type t :: %__MODULE__{
          cfg_scale: number | nil,
          clip_guidance_preset: String.t() | nil,
          extras: map | nil,
          image_strength: number | nil,
          init_image: String.t(),
          init_image_mode: String.t() | nil,
          sampler: String.t() | nil,
          samples: integer | nil,
          seed: integer | nil,
          step_schedule_end: number | nil,
          step_schedule_start: number | nil,
          steps: integer | nil,
          style_preset: String.t() | nil,
          text_prompts: [TextPrompt.t()]
        }

  defstruct [
    :cfg_scale,
    :clip_guidance_preset,
    :extras,
    :image_strength,
    :init_image,
    :init_image_mode,
    :sampler,
    :samples,
    :seed,
    :step_schedule_end,
    :step_schedule_start,
    :steps,
    :style_preset,
    :text_prompts
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cfg_scale: :number,
      clip_guidance_preset:
        {:enum, ["FAST_BLUE", "FAST_GREEN", "NONE", "SIMPLE", "SLOW", "SLOWER", "SLOWEST"]},
      extras: :map,
      image_strength: :number,
      init_image: {:string, :generic},
      init_image_mode: {:enum, ["IMAGE_STRENGTH", "STEP_SCHEDULE"]},
      sampler:
        {:enum,
         [
           "DDIM",
           "DDPM",
           "K_DPMPP_2M",
           "K_DPMPP_2S_ANCESTRAL",
           "K_DPM_2",
           "K_DPM_2_ANCESTRAL",
           "K_EULER",
           "K_EULER_ANCESTRAL",
           "K_HEUN",
           "K_LMS"
         ]},
      samples: :integer,
      seed: :integer,
      step_schedule_end: :number,
      step_schedule_start: :number,
      steps: :integer,
      style_preset:
        {:enum,
         [
           "enhance",
           "anime",
           "photographic",
           "digital-art",
           "comic-book",
           "fantasy-art",
           "line-art",
           "analog-film",
           "neon-punk",
           "isometric",
           "low-poly",
           "origami",
           "modeling-compound",
           "cinematic",
           "3d-model",
           "pixel-art",
           "tile-texture"
         ]},
      text_prompts: [{TextPrompt, :t}]
    ]
  end
end
